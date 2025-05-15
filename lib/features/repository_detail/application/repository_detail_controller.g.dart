// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$repoDetailDatasourceHash() =>
    r'b322f00f664bcd850fb47983f4a4b1d5bb38b6b4';

/// See also [repoDetailDatasource].
@ProviderFor(repoDetailDatasource)
final repoDetailDatasourceProvider =
    AutoDisposeProvider<IRepositoryDetailDatasource>.internal(
  repoDetailDatasource,
  name: r'repoDetailDatasourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repoDetailDatasourceHash,
  dependencies: <ProviderOrFamily>[dioProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    dioProvider,
    ...?dioProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RepoDetailDatasourceRef
    = AutoDisposeProviderRef<IRepositoryDetailDatasource>;
String _$repoDetailRepoHash() => r'c34232f9d054d33ee1373ad23206d7bf8dc9f39d';

/// See also [repoDetailRepo].
@ProviderFor(repoDetailRepo)
final repoDetailRepoProvider =
    AutoDisposeProvider<IRepositoryDetailRepository>.internal(
  repoDetailRepo,
  name: r'repoDetailRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repoDetailRepoHash,
  dependencies: <ProviderOrFamily>[repoDetailDatasourceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    repoDetailDatasourceProvider,
    ...?repoDetailDatasourceProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RepoDetailRepoRef = AutoDisposeProviderRef<IRepositoryDetailRepository>;
String _$repositoryDetailHash() => r'791c7d201a31bda1485bd6a894f4424f8d5d06c1';

/// See also [repositoryDetail].
@ProviderFor(repositoryDetail)
final repositoryDetailProvider =
    AutoDisposeFutureProvider<RepositoryEntity>.internal(
  repositoryDetail,
  name: r'repositoryDetailProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repositoryDetailHash,
  dependencies: <ProviderOrFamily>[repoNameProvider, repoDetailRepoProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    repoNameProvider,
    ...?repoNameProvider.allTransitiveDependencies,
    repoDetailRepoProvider,
    ...?repoDetailRepoProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RepositoryDetailRef = AutoDisposeFutureProviderRef<RepositoryEntity>;
String _$repoNameHash() => r'fe8ff0bab00ff887e9683e829fb54e7586ebdb83';

/// See also [repoName].
@ProviderFor(repoName)
final repoNameProvider = AutoDisposeProvider<String>.internal(
  repoName,
  name: r'repoNameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$repoNameHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RepoNameRef = AutoDisposeProviderRef<String>;
String _$repositoryReadmeHash() => r'd2f4bb2f8ee86c6ec79fc0074515af90b197911f';

/// See also [repositoryReadme].
@ProviderFor(repositoryReadme)
final repositoryReadmeProvider = AutoDisposeFutureProvider<String?>.internal(
  repositoryReadme,
  name: r'repositoryReadmeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repositoryReadmeHash,
  dependencies: <ProviderOrFamily>[repoNameProvider, repoDetailRepoProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    repoNameProvider,
    ...?repoNameProvider.allTransitiveDependencies,
    repoDetailRepoProvider,
    ...?repoDetailRepoProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RepositoryReadmeRef = AutoDisposeFutureProviderRef<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
