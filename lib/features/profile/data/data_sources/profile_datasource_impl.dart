import 'dart:async';

import 'package:dio/dio.dart';

import '../../../../core/remote/dio_service.dart';
import '../../../../core/utils/constants/api_endpoints.dart';
import '../model/user_profile_model.dart';

abstract interface class IProfileDataSource {
  FutureOr<UserProfileModel> getUserProfile();
}

class ProfileDataSourceImpl implements IProfileDataSource {
  final Dio _dio;

  ProfileDataSourceImpl(this._dio);

  @override
  FutureOr<UserProfileModel> getUserProfile() async {
    return DioService.run(
      request: () => _dio.get(ApiEndpoint.user + ApiEndpoint.userName),
      parse: (data) => UserProfileModel.fromMap(data),
    );
  }
}
