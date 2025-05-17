import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'core/router/app_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) => SkeletonizerConfig(
        data: SkeletonizerConfigData(
          effect: ShimmerEffect.raw(
            colors: [
              Colors.grey.shade300,
              const Color(0xFFF4F4F4),
              Colors.grey.shade100,
            ],
            stops: [0.1, 0.3, 0.4],
            begin: const Alignment(-1.0, -0.3),
            end: const Alignment(1.0, 0.3),
            tileMode: TileMode.clamp,
            duration: const Duration(milliseconds: 1100),
          ),
          enableSwitchAnimation: true,
          textBorderRadius: const TextBoneBorderRadius.fromHeightFactor(.4),
        ),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'GitHub Profile App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff1f2328)),
            useMaterial3: true,
          ),
          routerConfig: router,
          builder: BotToastInit(),
        ),
      ),
    );
  }
}
