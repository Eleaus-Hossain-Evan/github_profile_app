import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomToggleSwitch extends HookConsumerWidget {
  const CustomToggleSwitch({
    super.key,
    required this.value,
    this.loading = false,
    required this.onToggle,
  });

  final bool value;
  final bool loading;

  final VoidCallback onToggle;

  // @override
  // void didUpdateWidget(CustomToggleSwitch oldWidget) {
  //   super.didUpdateWidget(oldWidget);

  //   if (oldWidget.value == widget.value) return;

  //   if (widget.value) {
  //     _animationController.forward();
  //   } else {
  //     _animationController.reverse();
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parentHeight = 28.h;
    final parentWidth = 75.w;
    final parentPadding = 3.w;
    final innerContentPadding = 4.w;
    double textSpace =
        parentWidth - ((innerContentPadding - parentPadding) * 2);

    final animationController = useAnimationController(
      initialValue: value ? 0.0 : 1,
      duration: Duration(milliseconds: 500),
    );

    final toggleAnimation = useAnimation(AlignmentTween(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
      ),
    ));

    useEffect(() {
      // animationController.addStatusListener((status) {
      //   if (status == AnimationStatus.completed) {
      //     onToggle(true);
      //   } else if (status == AnimationStatus.dismissed) {
      //     onToggle(false);
      //   }
      // });
      if (!value) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
      return null;
    }, [value]);
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            // if (value) {
            //   animationController.forward();
            // } else {
            //   animationController.reverse();
            // }

            onToggle();
          },
          child: AnimatedContainer(
            duration: kThemeAnimationDuration,
            width: parentWidth,
            height: parentHeight,
            padding: EdgeInsets.all(parentPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: value ? Color(0xffff0000) : Color(0xff8f8f8f),
              boxShadow: kElevationToShadow[2],
            ),
            child: Stack(
              children: <Widget>[
                AnimatedOpacity(
                  opacity: value ? 1.0 : 0.0,
                  duration: animationController.duration!,
                  child: Container(
                    width: textSpace,
                    padding: EdgeInsets.only(
                        left: innerContentPadding + innerContentPadding),
                    alignment: Alignment.centerLeft,
                    child: _activeText,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedOpacity(
                    opacity: !value ? 1.0 : 0.0,
                    duration: animationController.duration!,
                    child: Container(
                      width: textSpace,
                      padding: EdgeInsets.only(right: innerContentPadding),
                      alignment: Alignment.centerRight,
                      child: _inactiveText,
                    ),
                  ),
                ),
                Align(
                  alignment: toggleAnimation,
                  child: Container(
                    width: 20.w,
                    height: 20.w,
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.r),
                      color: Colors.white,
                      boxShadow: kElevationToShadow[1],
                    ),
                    child: loading
                        ? CircularProgressIndicator.adaptive(
                            strokeWidth: 1.4,
                          )
                        : null,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget get _activeText {
    return Text(
      "Live",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 14.sp,
      ),
    );
  }

  Widget get _inactiveText {
    return Text(
      "Unlive",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 14.sp,
      ),
      textAlign: TextAlign.right,
    );
  }
}
