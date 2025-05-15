import '../../domain/entity/repository_entity.dart';
import '../../domain/repository/repositories_repository.dart';
import '../data_sources/repositories_datasource.dart';

class RepositoriesRepositoryImpl implements IRepositoriesRepository {
  final IRepositoriesDatasource _remoteDataSource;

  RepositoriesRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<RepositoryEntity>> getUserRepositories({int page = 1, int perPage = 10}) async {
    try {
      final repositoryModels = await _remoteDataSource.getUserRepositories(
        page: page,
        perPage: perPage,
      );
      return repositoryModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get user repositories: $e');
    }
  }
}
