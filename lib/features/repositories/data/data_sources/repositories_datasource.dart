import 'dart:async';

import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../model/repository_model.dart';

abstract interface class IRepositoriesDatasource {
  FutureOr<List<RepositoryModel>> getUserRepositories({int page = 1, int perPage = 10});
}

class RepositoriesDatasourceImpl implements IRepositoriesDatasource {
  final Dio _dio;

  RepositoriesDatasourceImpl(this._dio);

  @override
  FutureOr<List<RepositoryModel>> getUserRepositories({int page = 1, int perPage = 10}) async {
    return DioService.run(
      request: () => _dio.get(
        ApiEndpoint.user + ApiEndpoint.userName + ApiEndpoint.repos,
        queryParameters: {'per_page': perPage, 'page': page},
      ),
      parse: (data) => List<RepositoryModel>.from(
        (data as List).map(
          (e) => RepositoryModel.fromMap(e),
        ),
      ),
    );
  }
}
