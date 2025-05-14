import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/widgets.dart';
import '../../application/profile_controller.dart';
import '../../domain/entity/user_profile_entity.dart';

class ProfileScreen extends HookConsumerWidget {
  static const String route = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(
        title: AppText("Profile"),
      ),
      body: profileState.when(
        data: (UserProfileEntity? userProfile) {
          if (userProfile == null) {
            // This case might represent an initial state or cleared state
            return const Center(child: Text('Enter a username to search.'));
          }
          return _buildProfileView(context, userProfile);
        },
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

  Widget _buildProfileView(BuildContext context, UserProfileEntity userProfile) {
    return ListView(
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
            _buildStatColumn('Followers', userProfile.followers.toString()),
            _buildStatColumn('Following', userProfile.following.toString()),
            _buildStatColumn('Repositories', userProfile.publicRepos.toString()),
          ],
        ),
        const SizedBox(height: 16),
        if (userProfile.location != null && userProfile.location!.isNotEmpty)
          _buildInfoRow(Icons.location_on, userProfile.location!),
        if (userProfile.blog != null && userProfile.blog!.isNotEmpty)
          _buildInfoRow(Icons.link, userProfile.blog!),
        if (userProfile.email != null && userProfile.email!.isNotEmpty)
          _buildInfoRow(Icons.email, userProfile.email!),
        if (userProfile.company != null && userProfile.company!.isNotEmpty)
          _buildInfoRow(Icons.business, userProfile.company!),
      ],
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AppText(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: AppText(
            label,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.grey, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: AppText(text, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
