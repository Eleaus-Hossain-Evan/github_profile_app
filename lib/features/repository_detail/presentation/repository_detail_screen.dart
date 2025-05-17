import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/widgets.dart';
import '../application/repository_detail_controller.dart';
import 'widgets/readme_section.dart';
import 'widgets/repository_header.dart';

class RepositoryDetailScreen extends HookConsumerWidget {
  static const String route = '/detail';

  const RepositoryDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: KAppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(repositoryDetailProvider.future),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RepositoryHeader(),
            // const SizedBox(height: 24),
            // _buildCommitsSection(context, data.commits),
            const SizedBox(height: 24),
            ReadmeSection(),
          ],
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

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
