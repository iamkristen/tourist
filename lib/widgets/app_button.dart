import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.child,
    required this.size,
    required this.backgroundColor,
  }) : super(key: key);

  final Widget child;
  final Color backgroundColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(12)),
      child: child,
    );
  }
}
