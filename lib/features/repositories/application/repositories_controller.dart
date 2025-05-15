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

@Riverpod(dependencies: [repositoriesRepository])
class RepositoriesController extends _$RepositoriesController {
  @override
  FutureOr<PaginatedRepositoriesState> build() async {
    // Initialize the state and fetch first page
    return PaginatedRepositoriesState(
      repositories: [],
      isLoading: true,
      hasReachedEnd: false,
      currentPage: 1,
      perPage: 10,
    );
  }

  Future<void> fetchInitialRepositories() async {
    state = AsyncValue.data(state.value!.copyWith(isLoading: true, error: null));
    try {
      final repositoriesRepository = ref.watch(repositoriesRepositoryProvider);
      final repositories = await repositoriesRepository.getUserRepositories(
        page: 1,
        perPage: state.value!.perPage,
      );

      state = AsyncValue.data(state.value!.copyWith(
        repositories: repositories,
        isLoading: false,
        hasReachedEnd: repositories.isEmpty || repositories.length < state.value!.perPage,
        currentPage: 1,
        error: null,
      ));
    } catch (e) {
      state = AsyncValue.data(state.value!.copyWith(
        isLoading: false,
        error: () => e,
      ));
    }
  }

  Future<void> loadMoreRepositories() async {
    // Don't load more if we're already loading or have reached the end
    if (state.value!.isLoading || state.value!.hasReachedEnd) return;

    state = AsyncValue.data(state.value!.copyWith(isLoading: true));
    try {
      final nextPage = state.value!.currentPage + 1;
      final repositoriesRepository = ref.watch(repositoriesRepositoryProvider);
      final newRepositories = await repositoriesRepository.getUserRepositories(
        page: nextPage,
        perPage: state.value!.perPage,
      );

      // If we got fewer items than requested, we've reached the end
      final hasReachedEnd =
          newRepositories.isEmpty || newRepositories.length < state.value!.perPage;

      state = AsyncValue.data(state.value!.copyWith(
        repositories: [...state.value!.repositories, ...newRepositories],
        isLoading: false,
        hasReachedEnd: hasReachedEnd,
        currentPage: nextPage,
        error: null,
      ));
    } catch (e) {
      state = AsyncValue.data(state.value!.copyWith(
        isLoading: false,
        error: () => e,
      ));
    }
  }

  Future<void> refreshRepositories() async {
    // Reset state and fetch first page
    state = AsyncValue.data(state.value!.copyWith(
      isLoading: true,
      hasReachedEnd: false,
      currentPage: 1,
      error: null,
    ));

    try {
      final repositoriesRepository = ref.watch(repositoriesRepositoryProvider);
      final repositories = await repositoriesRepository.getUserRepositories(
        page: 1,
        perPage: state.value!.perPage,
      );

      state = AsyncValue.data(state.value!.copyWith(
        repositories: repositories,
        isLoading: false,
        hasReachedEnd: repositories.isEmpty || repositories.length < state.value!.perPage,
        currentPage: 1,
        error: null,
      ));
    } catch (e) {
      state = AsyncValue.data(state.value!.copyWith(
        isLoading: false,
        error: () => e,
      ));
    }
  }
}

@Riverpod(dependencies: [repositoriesRepository])
class UserListNotifier extends _$UserListNotifier {
  int _currentPage = 1;
  late IRepositoriesRepository _operatorsRepository;
  bool _noMoreItems = false;
  @override
  FutureOr<List<RepositoryEntity>> build() async {
    _operatorsRepository = ref.watch(repositoriesRepositoryProvider);
    _fetchInitialUsers();
    return [];
  }

  Future<void> _fetchInitialUsers() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final result = await _operatorsRepository.getUserRepositories(page: _currentPage);
      return result;
    });
  }

  Future<void> fetchPaginatedUsers() async {
    if (_noMoreItems) return;
    ref.read(paginationLoadingProvider.notifier).update(true);

    state = await AsyncValue.guard(
      () async {
        final result = await _operatorsRepository.getUserRepositories(page: _currentPage);
        final currentData = state.value ?? [];
        _currentPage++;
        _noMoreItems = result.length < 10;
        return [...currentData, ...result];
      },
    );
    ref.read(paginationLoadingProvider.notifier).update(false);
  }
}

@riverpod
class PaginationLoading extends _$PaginationLoading {
  @override
  bool build() => false;

  void update(bool value) {
    state = value;
  }
}
