import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/widgets/widgets.dart';
import '../../application/repository_detail_controller.dart';

class RepositoryHeader extends HookConsumerWidget {
  const RepositoryHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositoryAsync = ref.watch(repositoryDetailProvider);

    Future<void> launchingUrl(String url) async {
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

    return repositoryAsync.when(
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
                  if (repository.language != null) _buildStatItem(Icons.code, repository.language!),
                ],
              ),
              const SizedBox(height: 16),
              // Using ElevatedButton instead of KButton which doesn't exist
              ElevatedButton.icon(
                onPressed: () => launchingUrl(repository.htmlUrl),
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
    );
  }

  Widget _buildStatItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}
