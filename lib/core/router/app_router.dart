import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/common/presentation/screens/app_main_nav_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/repositories/presentation/repositories_list_screen.dart';
import '../../features/repository_detail/application/repository_detail_controller.dart';
import '../../features/repository_detail/presentation/repository_detail_screen.dart';

part 'app_router.g.dart';

// Private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>(debugLabel: 'ShellProfile');
final _shellNavigatorRepositoriesKey = GlobalKey<NavigatorState>(debugLabel: 'ShellRepositories');

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: ProfileScreen.route,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppMainNavScreen(navigationShell: navigationShell);
        },
        branches: [
          // Profile Tab
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: [
              GoRoute(
                path: ProfileScreen.route,
                name: ProfileScreen.route,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProfileScreen(),
                ),
              ),
            ],
          ),
          // Repositories Tab
          StatefulShellBranch(
            navigatorKey: _shellNavigatorRepositoriesKey,
            routes: [
              GoRoute(
                  path: RepositoriesListScreen.route,
                  name: RepositoriesListScreen.route,
                  pageBuilder: (context, state) => const NoTransitionPage(
                        child: RepositoriesListScreen(),
                      ),
                  routes: [
                    GoRoute(
                      path: '${RepositoryDetailScreen.route}/:repoName',
                      name: RepositoryDetailScreen.route,
                      pageBuilder: (context, state) => NoTransitionPage(
                        child: ProviderScope(
                          overrides: [
                            repoNameProvider.overrideWithValue(state.pathParameters['repoName']!)
                          ],
                          child: const RepositoryDetailScreen(),
                        ),
                      ),
                    ),
                  ]),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(child: Text('Page not found: ${state.error?.message}')),
    ),
  );
}
