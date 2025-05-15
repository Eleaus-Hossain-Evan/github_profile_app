import '../../repositories/domain/entity/repository_entity.dart';

abstract interface class IRepositoryDetailRepository {
  Future<RepositoryEntity> getRepositoryDetail(String repoName);
}
