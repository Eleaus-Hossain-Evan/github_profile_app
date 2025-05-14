import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/remote/dio_provider.dart';
import '../data/data_sources/profile_datasource_impl.dart';
import '../data/repository/profile_repository_impl.dart'; // Ensure this path is correct
import '../domain/entity/user_profile_entity.dart';
import '../domain/repository/i_profile_repository.dart';

part 'profile_controller.g.dart';

@Riverpod(dependencies: [dio])
IProfileDataSource profileDatasource(Ref ref) {
  return ProfileDataSourceImpl(ref.watch(dioProvider));
}

@Riverpod(dependencies: [profileDatasource])
IProfileRepository profileRepo(Ref ref) {
  return ProfileRepositoryImpl(ref.watch(profileDatasourceProvider));
}

@Riverpod(dependencies: [profileRepo])
FutureOr<UserProfileEntity> profile(Ref ref) async {
  final profileRepository = ref.read(profileRepoProvider);

  return profileRepository.getUserProfile();
}
