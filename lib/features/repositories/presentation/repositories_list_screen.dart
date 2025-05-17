import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/widgets/pagination_list_view.dart';
import '../../common/widgets/widgets.dart';
import '../application/repositories_controller.dart';
import 'widgets/repository_list_item.dart';

class RepositoriesListScreen extends HookConsumerWidget {
  static const String route = '/repositories';

  const RepositoriesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshController = useMemoized(RefreshController.new);
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
      body: SmartRefresher(
        controller: refreshController,
        onRefresh: () => ref
            .refresh(repositoriesControllerProvider.future)
            .then((value) => refreshController.refreshCompleted()),
        child: responseAsync.when(
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
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
