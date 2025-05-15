import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../../../repositories/data/model/repository_model.dart';

abstract interface class IRepositoryDetailDatasource {
  Future<RepositoryModel> fetchRepositoryDetail(String repoName);
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

  Future<String?> fetchRepositoryReadme(String owner, String repoName) async {
    try {
      final response = await _dio.get(
        'https://api.github.com/repos/$owner/$repoName/readme',
        options: Options(headers: {'Accept': 'application/vnd.github.html'}),
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null; // README not found
      }
      throw Exception('Failed to fetch repository README: ${e.message}');
    }
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
