import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository_detail/presentation/repository_detail_screen.dart';
import '../application/repositories_controller.dart';
import '../domain/entity/repository_entity.dart';

class RepositoriesListScreen extends HookConsumerWidget {
  static const String route = '/repositories';

  const RepositoriesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final repositoriesAsyncValue = ref.watch(userListNotifierProvider);

    // Add scroll listener for pagination
    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
          // Load more when we reach 80% of the list

          ref.read(userListNotifierProvider.notifier).fetchPaginatedUsers();
        }
      }

      // Future.microtask(
      //     () => ref.read(repositoriesControllerProvider.notifier).fetchInitialRepositories());
      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Repositories'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(userListNotifierProvider);
            },
          ),
        ],
      ),
      body: repositoriesAsyncValue.when(
        data: (state) {
          if (state.isEmpty) {
            return const Center(
              child: Text('No repositories found.'),
            );
          }

          return RefreshIndicator(
            onRefresh: () =>
                ref.read(repositoriesControllerProvider.notifier).refreshRepositories(),
            child: ListView.builder(
              controller: scrollController,
              itemCount: state.length,
              itemBuilder: (context, index) {
                // Show loading indicator at the bottom while loading more
                if (index == state.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final repo = state[index];
                return RepositoryListItem(repository: repo);
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          print('Error fetching repositories: $error');
          print(stackTrace);
          return Center(
            child: SelectableText.rich(
              TextSpan(
                text: 'Failed to load repositories: ${error.toString()}',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        },
      ),
    );
  }
}

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
