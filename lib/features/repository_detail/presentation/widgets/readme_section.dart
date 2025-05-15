import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/widgets.dart';
import '../../application/repository_detail_controller.dart';

class ReadmeSection extends HookConsumerWidget {
  const ReadmeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readmeAsync = ref.watch(repositoryReadmeProvider);

    return readmeAsync.when(
        data: (readme) {
          if (readme == null || readme.isEmpty) {
            return const SizedBox();
          }
          return ExpansionTile(
            initiallyExpanded: true,
            title: const Text('README'),
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  // Note: For proper README rendering, you might want to use a markdown package
                  // like flutter_markdown, but for simplicity we're using a basic approach here
                  child: Html(data: readme),
                ),
              ),
            ],
          );
        },
        loading: () => const KLoadingWidget(),
        error: (error, stackTrace) => ErrorBody(
              error: error,
              stackTrace: stackTrace,
            ));
  }
}
