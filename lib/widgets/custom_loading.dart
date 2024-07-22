import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key, required this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lottie/loading.json', width: width);
  }
}
