import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../repository_detail/presentation/repository_detail_screen.dart';
import '../../domain/entity/repository_entity.dart';

class RepositoryListItem extends StatelessWidget {
  final RepositoryEntity repository;

  const RepositoryListItem({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(repository.name, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (repository.description != null && repository.description!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                child: Text(repository.description!),
              ),
            Row(
              children: <Widget>[
                const Icon(Icons.star_border, size: 16),
                const SizedBox(width: 4),
                Text('${repository.stargazersCount}'),
                const SizedBox(width: 16),
                const Icon(Icons.call_split, size: 16), // Using call_split for forks icon
                const SizedBox(width: 4),
                Text('${repository.forksCount}'),
                if (repository.language != null && repository.language!.isNotEmpty) ...[
                  const SizedBox(width: 16),
                  const Icon(Icons.code, size: 16),
                  const SizedBox(width: 4),
                  Text(repository.language!),
                ],
              ],
            ),
          ],
        ),
        onTap: () {
          print('Tapped on ${repository.name}');
          context.pushNamed(RepositoryDetailScreen.route,
              pathParameters: {'repoName': repository.name});
        },
      ),
    );
  }
}

class RepositoryListItemLoader extends StatelessWidget {
  const RepositoryListItemLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Bone.text(words: 2, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Row(
          children: <Widget>[
            const Bone.icon(size: 16),
            const SizedBox(width: 4),
            Bone.text(width: 12, fontSize: 14),
            const SizedBox(width: 16),
            const Bone.icon(size: 16),
            const SizedBox(width: 4),
            Bone.text(width: 12, fontSize: 14),
            const SizedBox(width: 16),
            const Bone.icon(size: 16),
            const SizedBox(width: 4),
            Bone.text(width: 20, fontSize: 14),
          ],
        ),
      ),
    );
  }
}
