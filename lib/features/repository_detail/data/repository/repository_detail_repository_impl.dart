import '../../../repositories/domain/entity/repository_entity.dart';
import '../../domain/i_repository_detail_repository.dart';
import '../data_sources/repository_detail_remote_data_source.dart';

class RepositoryDetailRepositoryImpl implements IRepositoryDetailRepository {
  final IRepositoryDetailDatasource _dataSource;

  RepositoryDetailRepositoryImpl(this._dataSource);

  @override
  Future<RepositoryEntity> getRepositoryDetail(String repoName) async {
    final repoData = await _dataSource.fetchRepositoryDetail(repoName);

    return repoData.toEntity();
  }
}
