import 'package:flutter/material.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({
    super.key,
    this.message = "",
    this.strokeWidth = 2.0,
    this.padding,
  });

  final String message;
  final double strokeWidth;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) => Container(
        padding: padding,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(strokeWidth: strokeWidth),
            if (message.isNotEmpty) const SizedBox(height: 8),
            if (message.isNotEmpty) Text(message)
          ],
        ),
      );
}
