// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileDatasourceHash() => r'16fec7a45cad50f46458da7997e3f9c0ba7735a1';

/// See also [profileDatasource].
@ProviderFor(profileDatasource)
final profileDatasourceProvider =
    AutoDisposeProvider<IProfileDataSource>.internal(
  profileDatasource,
  name: r'profileDatasourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileDatasourceHash,
  dependencies: <ProviderOrFamily>[dioProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    dioProvider,
    ...?dioProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProfileDatasourceRef = AutoDisposeProviderRef<IProfileDataSource>;
String _$profileRepoHash() => r'e445e8464641cd698b1bce164b03ba26df50c535';

/// See also [profileRepo].
@ProviderFor(profileRepo)
final profileRepoProvider = AutoDisposeProvider<IProfileRepository>.internal(
  profileRepo,
  name: r'profileRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$profileRepoHash,
  dependencies: <ProviderOrFamily>[profileDatasourceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    profileDatasourceProvider,
    ...?profileDatasourceProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProfileRepoRef = AutoDisposeProviderRef<IProfileRepository>;
String _$profileHash() => r'560e434b64c7bb30b13409fe99b828e4580ba008';

/// See also [profile].
@ProviderFor(profile)
final profileProvider = AutoDisposeFutureProvider<UserProfileEntity>.internal(
  profile,
  name: r'profileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$profileHash,
  dependencies: <ProviderOrFamily>[profileRepoProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    profileRepoProvider,
    ...?profileRepoProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProfileRef = AutoDisposeFutureProviderRef<UserProfileEntity>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
