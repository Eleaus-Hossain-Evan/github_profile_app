import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core.dart';
import '../data/data_sources/repositories_datasource.dart';
import '../data/repository/repositories_repository_impl.dart'; // Adjusted import
import '../domain/entity/repository_entity.dart';
import '../domain/repository/repositories_repository.dart';
import 'repositories_state.dart';

part 'repositories_controller.g.dart';

@Riverpod(dependencies: [dio])
IRepositoriesDatasource repositoriesDataSource(Ref ref) {
  return RepositoriesDatasourceImpl(ref.watch(dioProvider));
}

@Riverpod(dependencies: [repositoriesDataSource])
IRepositoriesRepository repositoriesRepository(Ref ref) {
  final dataSource = ref.watch(repositoriesDataSourceProvider);
  return RepositoriesRepositoryImpl(dataSource);
}

// We need to pass the username to this controller.
// A family modifier is suitable here.
@Riverpod(dependencies: [repositoriesRepository])
class RepositoriesController extends _$RepositoriesController {
  static const _perPage = 10;

  @override
  FutureOr<PaginatedRepos> build() async {
    final items = await _fetchRepositories(1);
    return PaginatedRepos(
      items: items,
      page: 1,
      hasMore: items.length == _perPage,
    );
  }

  Future<List<RepositoryEntity>> _fetchRepositories(int page) async {
    final repository = ref.read(repositoriesRepositoryProvider);
    final newItems = await repository.getUserRepositories(
      page: page,
      perPage: _perPage,
    );

    return newItems;
  }

  Future<void> fetchNextPage() async {
    final stateValue = state.valueOrNull;
    if (state.isLoading || stateValue == null || !stateValue.hasMore) {
      return;
    }

    // Mark loading state.
    // state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // Fetch subsequent page.
      final nextPage = stateValue.page + 1;
      final newItems = await _fetchRepositories(nextPage);
      final all = [...stateValue.items, ...newItems];

      return PaginatedRepos(
        items: all,
        page: nextPage,
        hasMore: newItems.length == _perPage,
      );
    });
  }
}
