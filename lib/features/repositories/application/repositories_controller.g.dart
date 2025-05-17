// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$repositoriesDataSourceHash() =>
    r'61e5b2c6c8a6823dcd54c143dff9ab4ac9e13e33';

/// See also [repositoriesDataSource].
@ProviderFor(repositoriesDataSource)
final repositoriesDataSourceProvider =
    AutoDisposeProvider<IRepositoriesDatasource>.internal(
  repositoriesDataSource,
  name: r'repositoriesDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repositoriesDataSourceHash,
  dependencies: <ProviderOrFamily>[dioProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    dioProvider,
    ...?dioProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RepositoriesDataSourceRef
    = AutoDisposeProviderRef<IRepositoriesDatasource>;
String _$repositoriesRepositoryHash() =>
    r'66db8e96f64af8d9dfecc02985f852dada279569';

/// See also [repositoriesRepository].
@ProviderFor(repositoriesRepository)
final repositoriesRepositoryProvider =
    AutoDisposeProvider<IRepositoriesRepository>.internal(
  repositoriesRepository,
  name: r'repositoriesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repositoriesRepositoryHash,
  dependencies: <ProviderOrFamily>[repositoriesDataSourceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    repositoriesDataSourceProvider,
    ...?repositoriesDataSourceProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RepositoriesRepositoryRef
    = AutoDisposeProviderRef<IRepositoriesRepository>;
String _$repositoriesControllerHash() =>
    r'cbcc68d35974f0b5a6ed441fa4a8b9e9463f0366';

/// See also [RepositoriesController].
@ProviderFor(RepositoriesController)
final repositoriesControllerProvider = AutoDisposeAsyncNotifierProvider<
    RepositoriesController, PaginatedRepos>.internal(
  RepositoriesController.new,
  name: r'repositoriesControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repositoriesControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RepositoriesController = AutoDisposeAsyncNotifier<PaginatedRepos>;
String _$userListNotifierHash() => r'2ec61d1b23155b2c6e0ac655fe951c19927ccf1d';

/// See also [UserListNotifier].
@ProviderFor(UserListNotifier)
final userListNotifierProvider = AutoDisposeAsyncNotifierProvider<
    UserListNotifier, List<RepositoryEntity>>.internal(
  UserListNotifier.new,
  name: r'userListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userListNotifierHash,
  dependencies: <ProviderOrFamily>[repositoriesRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    repositoriesRepositoryProvider,
    ...?repositoriesRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$UserListNotifier = AutoDisposeAsyncNotifier<List<RepositoryEntity>>;
String _$paginationLoadingHash() => r'83427e6949f69cc468a03d81e0326e028f404fb7';

/// See also [PaginationLoading].
@ProviderFor(PaginationLoading)
final paginationLoadingProvider =
    AutoDisposeNotifierProvider<PaginationLoading, bool>.internal(
  PaginationLoading.new,
  name: r'paginationLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paginationLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PaginationLoading = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
