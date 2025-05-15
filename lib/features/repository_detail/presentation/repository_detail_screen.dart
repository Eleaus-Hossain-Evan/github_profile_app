import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/widgets/widgets.dart';
import '../application/repository_detail_controller.dart';

class RepositoryDetailScreen extends HookConsumerWidget {
  static const String route = '/detail';

  const RepositoryDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositoryAsync = ref.watch(repositoryDetailProvider);

    return Scaffold(
      appBar: KAppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(repositoryDetailProvider.future),
          ),
        ],
      ),
      body: repositoryAsync.when(
        data: (repository) => Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(repository.name, fontSize: 24),
                if (repository.description != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    repository.description!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildStatItem(Icons.star_border, '${repository.stargazersCount}'),
                    const SizedBox(width: 16),
                    _buildStatItem(Icons.fork_right, '${repository.forksCount}'),
                    const SizedBox(width: 16),
                    if (repository.language != null)
                      _buildStatItem(Icons.code, repository.language!),
                  ],
                ),
                const SizedBox(height: 16),
                // Using ElevatedButton instead of KButton which doesn't exist
                ElevatedButton.icon(
                  onPressed: () => _launchUrl(repository.htmlUrl),
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('Open in GitHub'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
        loading: () => const KLoadingWidget(),
        error: (error, stackTrace) => ErrorBody(
          error: error,
          stackTrace: stackTrace,
          // onRetry: () => ref.refresh(repositoryDetailControllerProvider(owner, repoName)),
        ),
      ),
    );
  }

  // Widget _buildRepositoryDetail(BuildContext context, RepositoryEntity data) {
  //   return SingleChildScrollView(
  //     padding: const EdgeInsets.all(16.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         _buildRepositoryHeader(context, data),
  //         const SizedBox(height: 24),
  //         _buildCommitsSection(context, data.commits),
  //         const SizedBox(height: 24),
  //         if (data.readme != null) _buildReadmeSection(context, data.readme!),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildRepositoryHeader(BuildContext context, repository) {
  //   return;
  // }

  Widget _buildStatItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }

  // Widget _buildCommitsSection(BuildContext context, List<CommitInfo> commits) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const AppText('Recent Commits', fontSize: 20),
  //       const SizedBox(height: 8),
  //       Card(
  //         elevation: 2,
  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //         child: ListView.separated(
  //           shrinkWrap: true,
  //           physics: const NeverScrollableScrollPhysics(),
  //           itemCount: commits.length,
  //           separatorBuilder: (context, index) => const Divider(),
  //           itemBuilder: (context, index) {
  //             final commit = commits[index];
  //             return ListTile(
  //               title: Text(
  //                 commit.message,
  //                 maxLines: 2,
  //                 overflow: TextOverflow.ellipsis,
  //               ),
  //               subtitle: Text(
  //                 '${commit.authorName} • ${_formatDate(commit.date)}',
  //                 style: Theme.of(context).textTheme.bodySmall,
  //               ),
  //               trailing: Text(
  //                 commit.sha.substring(0, 7),
  //                 style: TextStyle(
  //                   fontFamily: 'monospace',
  //                   color: Theme.of(context).colorScheme.primary,
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildReadmeSection(BuildContext context, String readme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText('README', fontSize: 20),
        const SizedBox(height: 8),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            // Note: For proper README rendering, you might want to use a markdown package
            // like flutter_markdown, but for simplicity we're using a basic approach here
            child: SelectableText(readme),
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Future<void> _launchUrl(String url) async {
    // Introducing an error by incorrectly formatting the URL
    // This will cause the URL launcher to fail
    final formattedUrl = url.replaceAll('https://', 'http://');

    try {
      if (!await launchUrl(Uri.parse(formattedUrl))) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      // Silently fail without showing error to user
      print('Error launching URL: $e');
    }
  }
}
