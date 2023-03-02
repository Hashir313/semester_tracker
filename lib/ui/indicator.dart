import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Indicator extends StatelessWidget {
  final bool isActive;

  const Indicator({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      width: isActive ? 22.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
          color: isActive ? Colors.orangeAccent : Colors.grey,
          borderRadius: BorderRadius.circular(8.0)),
      duration: const Duration(milliseconds: 350),
    );
  }
}