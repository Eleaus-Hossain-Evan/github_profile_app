import '../../domain/entity/user_profile_entity.dart';
import '../../domain/repository/i_profile_repository.dart';
import '../data_sources/profile_datasource_impl.dart';

class ProfileRepositoryImpl implements IProfileRepository {
  final IProfileDataSource _remoteDataSource;

  ProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<UserProfileEntity> getUserProfile() async {
    final model = await _remoteDataSource.getUserProfile();
    return model.toEntity();
  }
}
