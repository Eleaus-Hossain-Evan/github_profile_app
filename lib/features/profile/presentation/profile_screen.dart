import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/widgets.dart';
import '../application/profile_controller.dart';
import 'widgets/info_row.dart';
import 'widgets/stat_column.dart';

class ProfileScreen extends HookConsumerWidget {
  static const String route = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);

    return Scaffold(
      body: profileState.when(
        data: (userProfile) => SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: CachedNetworkImageProvider(userProfile.avatarUrl),
                ),
              ),
              const SizedBox(height: 16),
              AppText(
                userProfile.name ?? userProfile.login,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              if (userProfile.name != null && userProfile.name != userProfile.login)
                AppText(
                  '@${userProfile.login}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 8),
              if (userProfile.bio != null && userProfile.bio!.isNotEmpty)
                AppText(
                  userProfile.bio!,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  StatColumn(label: 'Followers', value: userProfile.followers.toString()),
                  StatColumn(label: 'Following', value: userProfile.following.toString()),
                  StatColumn(label: 'Repositories', value: userProfile.publicRepos.toString()),
                ],
              ),
              const SizedBox(height: 16),
              if (userProfile.location != null && userProfile.location!.isNotEmpty)
                InfoRow(icon: Icons.location_on, text: userProfile.location!),
              if (userProfile.blog != null && userProfile.blog!.isNotEmpty)
                InfoRow(icon: Icons.link, text: userProfile.blog!),
              if (userProfile.email != null && userProfile.email!.isNotEmpty)
                InfoRow(icon: Icons.email, text: userProfile.email!),
              if (userProfile.company != null && userProfile.company!.isNotEmpty)
                InfoRow(icon: Icons.business, text: userProfile.company!),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: SelectableText.rich(
            TextSpan(
              text: 'Error: ${error.toString()}',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
