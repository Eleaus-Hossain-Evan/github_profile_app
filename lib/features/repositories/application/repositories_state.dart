import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../domain/entity/repository_entity.dart';

class PaginatedRepositoriesState extends Equatable {
  final List<RepositoryEntity> repositories;
  final bool isLoading;
  final bool hasReachedEnd;
  final Object? error;
  final int currentPage;
  final int perPage;

  const PaginatedRepositoriesState({
    required this.repositories,
    required this.isLoading,
    required this.hasReachedEnd,
    this.error,
    required this.currentPage,
    required this.perPage,
  });

  PaginatedRepositoriesState copyWith({
    List<RepositoryEntity>? repositories,
    bool? isLoading,
    bool? hasReachedEnd,
    ValueGetter<Object?>? error,
    int? currentPage,
    int? perPage,
  }) {
    return PaginatedRepositoriesState(
      repositories: repositories ?? this.repositories,
      isLoading: isLoading ?? this.isLoading,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      error: error != null ? error() : this.error,
      currentPage: currentPage ?? this.currentPage,
      perPage: perPage ?? this.perPage,
    );
  }

  @override
  String toString() {
    return 'PaginatedRepositoriesState(repositories: $repositories, isLoading: $isLoading, hasReachedEnd: $hasReachedEnd, error: $error, currentPage: $currentPage, perPage: $perPage)';
  }

  @override
  List<Object?> get props {
    return [
      repositories,
      isLoading,
      hasReachedEnd,
      error,
      currentPage,
      perPage,
    ];
  }

  bool get hasValue => repositories.isNotEmpty;
}
