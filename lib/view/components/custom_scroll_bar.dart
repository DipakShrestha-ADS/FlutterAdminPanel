import 'package:flutter/material.dart';

class CustomScrollBar extends StatelessWidget {
  final Widget child;
  final ScrollController scrollController;
  final bool isAlwaysShown;
  final double thickness;
  final double radius;

  CustomScrollBar({
    @required this.child,
    @required this.scrollController,
    this.isAlwaysShown,
    this.thickness,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: child,
      controller: scrollController,
      radius: radius ?? Radius.circular(5),
      isAlwaysShown: isAlwaysShown ?? false,
      thickness: thickness ?? null,
    );
  }
}
