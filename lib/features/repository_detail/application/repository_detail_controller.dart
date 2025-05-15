import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core.dart';
import '../../repositories/domain/entity/repository_entity.dart';
import '../data/data_sources/repository_detail_remote_data_source.dart';
import '../data/repository/repository_detail_repository_impl.dart';
import '../domain/i_repository_detail_repository.dart';

part 'repository_detail_controller.g.dart';

@Riverpod(dependencies: [dio])
IRepositoryDetailDatasource repoDetailDatasource(Ref ref) {
  return RepositoryDetailDatasource(ref.watch(dioProvider));
}

@Riverpod(dependencies: [repoDetailDatasource])
IRepositoryDetailRepository repoDetailRepo(Ref ref) {
  return RepositoryDetailRepositoryImpl(ref.watch(repoDetailDatasourceProvider));
}

@Riverpod(dependencies: [repoName, repoDetailRepo])
FutureOr<RepositoryEntity> repositoryDetail(Ref ref) async {
  final repoName = ref.watch(repoNameProvider);
  return ref.watch(repoDetailRepoProvider).getRepositoryDetail(repoName);
}

@Riverpod(dependencies: [])
String repoName(Ref ref) {
  throw UnimplementedError('Provider was not overridden');
}

@Riverpod(dependencies: [repoName, repoDetailRepo])
FutureOr<String?> repositoryReadme(Ref ref) {
  final repoName = ref.watch(repoNameProvider);
  return ref.watch(repoDetailRepoProvider).fetchRepositoryReadme(repoName);
}
