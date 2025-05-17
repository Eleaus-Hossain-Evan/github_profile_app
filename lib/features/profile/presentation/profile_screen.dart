import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/core.dart';
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

    ref.listen(profileProvider, (previous, next) {
      ref.handleAsyncValue(context, previous, next);
    });

    return Scaffold(
      body: profileState.when(
        skipLoadingOnRefresh: false,
        data: (userProfile) {
          return SafeArea(
            child: RefreshIndicator.adaptive(
              onRefresh: () => ref.refresh(profileProvider.future),
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CachedNetworkImageProvider(userProfile.avatarUrl),
                    ).animate().fadeIn().scaleXY(begin: 0.8, end: 1),
                  ),
                  16.verticalSpace,
                  AppText(
                    userProfile.name ?? userProfile.login,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ).animate().fadeIn().scaleXY(begin: 0.8, end: 1),
                  if (userProfile.name != null && userProfile.name != userProfile.login)
                    AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText(
                          '@${userProfile.login}',
                          textStyle:
                              Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
                          textAlign: TextAlign.center,
                          speed: Duration(milliseconds: 30),
                        ),
                      ],
                    ),
                  8.verticalSpace,
                  if (userProfile.bio != null && userProfile.bio!.isNotEmpty)
                    AppText(
                      userProfile.bio!,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  16.verticalSpace,
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
          );
        },
        loading: () => Skeletonizer(
          child: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                Center(
                  child: Bone.circle(
                    size: 100,
                  ),
                ),
                20.verticalSpace,
                Bone.text(
                  words: 2,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                8.verticalSpace,
                Bone.text(
                  words: 2,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                14.verticalSpace,
                Bone.multiText(
                  lines: 4,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.8),
                  textAlign: TextAlign.center,
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    StatColumnLoader(label: 60, value: 30),
                    StatColumnLoader(label: 80, value: 30),
                    StatColumnLoader(label: 50, value: 25),
                  ],
                ),
                const SizedBox(height: 16),
                InfoRowLoader(words: 2),
                InfoRowLoader(words: 3),
                InfoRowLoader(words: 1),
                InfoRowLoader(words: 4),
              ],
            ),
          ),
        ),
        error: (error, stackTrace) => ErrorBody(
          error: error,
          stackTrace: stackTrace,
        ),
      ),
    );
  }
}
