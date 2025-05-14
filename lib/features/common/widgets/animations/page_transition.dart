import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PageTransitionType {
  none,
  fadeIn,
  scaleUp,
  scaleDown,
  scaleDownWithFadeIn,
  scaleUpWithFadeIn,
  fromLeft,
  fromTop,
  fromRight,
  fromBottom,
  slideUpWithFadeIn,
}

class PageTransition extends PageRouteBuilder {
  final Widget child;

  final Duration duration;

  final Curve curve;

  final PageTransitionType type;

  PageTransition({
    required this.child,
    required this.type,
    this.curve = Curves.fastOutSlowIn,
    this.duration = const Duration(milliseconds: 450),
  }) : super(
          transitionDuration: duration,
          pageBuilder: (_, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return transitionsBuilder(context, animation, secondaryAnimation, child, type, curve);
          },
        );
}

class GoRouteTransitionPage extends CustomTransitionPage {
  GoRouteTransitionPage({
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
    required super.child,
    super.fullscreenDialog = true,
    super.transitionDuration = const Duration(milliseconds: 300),
    super.reverseTransitionDuration = const Duration(milliseconds: 300),
    super.maintainState = true,
    super.opaque = true,
    super.barrierDismissible = false,
    super.barrierColor,
    super.barrierLabel,
    PageTransitionType type = PageTransitionType.none,
    Curve curve = Curves.easeInOut,
  }) : super(
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return transitionsBuilder(context, animation, secondaryAnimation, child, type, curve);
          }, // Here you may also wrap this child with some common designed widget
        );
}

Widget transitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
  PageTransitionType type,
  Curve curve,
) {
  final animatedCurve = CurvedAnimation(parent: animation, curve: curve);
  switch (type) {
    case PageTransitionType.none:
      return child;
    case PageTransitionType.fadeIn:
      return FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animatedCurve),
        child: child,
      );
    case PageTransitionType.scaleUp:
      return ScaleTransition(
        scale: Tween<double>(begin: 0, end: 1).animate(animatedCurve),
        child: child,
      );
    case PageTransitionType.scaleDown:
      return ScaleTransition(
        scale: Tween<double>(begin: 2, end: 1).animate(animatedCurve),
        child: child,
      );
    case PageTransitionType.scaleUpWithFadeIn:
      return ScaleTransition(
        scale: Tween<double>(begin: 0.8, end: 1).animate(animatedCurve),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(animatedCurve),
          child: child,
        ),
      );
    case PageTransitionType.scaleDownWithFadeIn:
      return ScaleTransition(
        scale: Tween<double>(begin: 1.2, end: 1).animate(animatedCurve),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(animatedCurve),
          child: child,
        ),
      );
    case PageTransitionType.fromTop:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: const Offset(0, 0),
        ).animate(animatedCurve),
        child: child,
      );
    case PageTransitionType.fromLeft:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: const Offset(0, 0),
        ).animate(animatedCurve),
        child: child,
      );
    case PageTransitionType.fromBottom:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(animatedCurve),
        child: child,
      );
    case PageTransitionType.fromRight:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
        ).animate(animatedCurve),
        child: child,
      );
    case PageTransitionType.slideUpWithFadeIn:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.5),
          end: const Offset(0, 0),
        ).animate(animatedCurve),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(animatedCurve),
          child: child,
        ),
      );
  }
}
