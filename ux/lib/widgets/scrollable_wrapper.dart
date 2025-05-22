import 'package:flutter/material.dart';

/// A reusable scrollable wrapper that automatically adds scroll when content overflows.
/// Wrap any widget with this to allow scrollability without modifying the screen itself.
class ScrollableWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const ScrollableWrapper({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: padding,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: child,
            ),
          ),
        );
      },
    );
  }
}