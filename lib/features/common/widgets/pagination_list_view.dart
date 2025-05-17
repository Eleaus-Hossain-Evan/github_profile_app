import 'package:flutter/material.dart';

class PaginationListView extends StatelessWidget {
  const PaginationListView({
    super.key,
    required this.scrollController,
    required this.hasMore,
    required this.itemCount,
    required this.itemBuilder,
  });

  final ScrollController scrollController;
  final bool hasMore;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: hasMore ? itemCount + 1 : itemCount,
      // isLoading: responseAsync.isLoading,
      // hasError: responseAsync.hasError,
      // // hasReachedMax: data.length % _pageSize != 0,
      // onFetchData: () => repositoriesNotifier.fetchNextPage(),
      itemBuilder: (context, index) {
        if (index < itemCount) {
          return itemBuilder(context, index);
        }
        // Loading indicator at bottom.
        return const Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
