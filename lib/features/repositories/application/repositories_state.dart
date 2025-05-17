import 'package:equatable/equatable.dart';

import '../domain/entity/repository_entity.dart';

class PaginatedRepos extends Equatable {
  final List<RepositoryEntity> items;
  final int page;
  final bool hasMore;

  const PaginatedRepos({
    required this.items,
    required this.page,
    required this.hasMore,
  });

  PaginatedRepos copyWith({
    List<RepositoryEntity>? items,
    int? page,
    bool? hasMore,
  }) {
    return PaginatedRepos(
      items: items ?? this.items,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  String toString() => 'PaginatedRepos(items: $items, page: $page, hasMore: $hasMore)';

  @override
  List<Object> get props => [items, page, hasMore];
}
