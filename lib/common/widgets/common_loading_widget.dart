import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/images/animation_loadding.json', // Đường dẫn đến file Lottie JSON
        width: 120, // Điều chỉnh kích thước
        height: 120, // Điều chỉnh kích thước
        fit: BoxFit.cover, // Căn chỉnh animation
      ),
    );
  }
}
