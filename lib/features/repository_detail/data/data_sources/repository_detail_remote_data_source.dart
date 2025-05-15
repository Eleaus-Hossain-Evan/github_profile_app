import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../../../repositories/data/model/repository_model.dart';

abstract interface class IRepositoryDetailDatasource {
  Future<RepositoryModel> fetchRepositoryDetail(String repoName);
  Future<String?> fetchRepositoryReadme(String repoName);
}

class RepositoryDetailDatasource implements IRepositoryDetailDatasource {
  final Dio _dio;

  RepositoryDetailDatasource(this._dio);

  @override
  Future<RepositoryModel> fetchRepositoryDetail(String repoName) async {
    return DioService.run(
      request: () => _dio.get("${ApiEndpoint.repos}/${ApiEndpoint.userName}/$repoName"),
      parse: (data) => RepositoryModel.fromMap(data),
    );
  }

  @override
  Future<String?> fetchRepositoryReadme(String repoName) async {
    return DioService.run(
      request: () => _dio.get(
        "${ApiEndpoint.repos}/${ApiEndpoint.userName}/$repoName/readme",
        options: Options(headers: {'Accept': 'application/vnd.github.html'}),
      ),
      parse: (data) => data as String?,
    );
  }

  Future<List<Map<String, dynamic>>> fetchRepositoryCommits(
    String owner,
    String repoName, {
    int perPage = 5,
  }) async {
    try {
      final response = await _dio.get(
        'https://api.github.com/repos/$owner/$repoName/commits',
        queryParameters: {'per_page': perPage},
      );
      return List<Map<String, dynamic>>.from(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to fetch repository commits: ${e.message}');
    }
  }
}
