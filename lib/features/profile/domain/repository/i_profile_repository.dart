import '../entity/user_profile_entity.dart';

abstract interface class IProfileRepository {
  Future<UserProfileEntity> getUserProfile();
}
