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
    r'e48a6172c24d0e9bb4cbf3e588699e26fdc17d68';

/// See also [RepositoriesController].
@ProviderFor(RepositoriesController)
final repositoriesControllerProvider = AutoDisposeAsyncNotifierProvider<
    RepositoriesController, PaginatedRepos>.internal(
  RepositoriesController.new,
  name: r'repositoriesControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repositoriesControllerHash,
  dependencies: <ProviderOrFamily>[repositoriesRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    repositoriesRepositoryProvider,
    ...?repositoriesRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$RepositoriesController = AutoDisposeAsyncNotifier<PaginatedRepos>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
