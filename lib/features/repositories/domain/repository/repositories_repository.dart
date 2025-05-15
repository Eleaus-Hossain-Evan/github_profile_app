import '../entity/repository_entity.dart';

abstract class IRepositoriesRepository {
  Future<List<RepositoryEntity>> getUserRepositories({int page = 1, int perPage = 10});
}
