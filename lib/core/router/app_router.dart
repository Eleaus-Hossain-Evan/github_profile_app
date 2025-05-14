import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/profile/presentation/screens/profile_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: ProfileScreen.route,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: ProfileScreen.route,
        name: ProfileScreen.route,
        builder: (context, state) => const ProfileScreen(),
      )
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(child: Text('Page not found: ${state.error?.message}')),
    ),
  );
}
