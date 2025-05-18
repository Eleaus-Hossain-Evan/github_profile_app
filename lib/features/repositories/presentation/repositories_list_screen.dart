import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../common/widgets/pagination_list_view.dart';
import '../../common/widgets/widgets.dart';
import '../application/repositories_controller.dart';
import 'widgets/repository_list_item.dart';

class RepositoriesListScreen extends HookConsumerWidget {
  static const String route = '/repositories';

  const RepositoriesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Add scroll listener for pagination
    final responseAsync = ref.watch(repositoriesControllerProvider);
    final repositoriesNotifier = ref.read(repositoriesControllerProvider.notifier);

    final scrollController = useScrollController();

    useEffect(() {
      void listener() {
        if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200) {
          repositoriesNotifier.fetchNextPage();
        }
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController, repositoriesNotifier, responseAsync]);

    return Scaffold(
      appBar: KAppBar(
        titleText: 'Repositories',
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () => ref.refresh(repositoriesControllerProvider.future),
        child: responseAsync.when(
          skipLoadingOnRefresh: false,
          data: (data) => PaginationListView(
            scrollController: scrollController,
            hasMore: data.hasMore,
            itemCount: data.items.length,
            itemBuilder: (context, index) => RepositoryListItem(repository: data.items[index]),
          ),
          error: (error, stackTrace) => ErrorBody(
            error: error,
            stackTrace: stackTrace,
          ),
          loading: () => Skeletonizer(
            child: Column(
              children: List.generate(
                8,
                (index) => const RepositoryListItemLoader(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
