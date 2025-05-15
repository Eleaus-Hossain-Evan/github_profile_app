import 'package:flutter/material.dart';

//加载提示的Widget
class KLoadingWidget extends StatelessWidget {
  const KLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const CircularProgressIndicator(
        backgroundColor: Colors.white,
      ),
    );
  }
}
