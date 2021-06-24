import 'package:flutter/material.dart';

class CircleLogoMain extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final EdgeInsets padding;

  CircleLogoMain({
    @required this.width,
    @required this.height,
    @required this.backgroundColor,
    @required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        child: Padding(
          padding: padding,
          child: Image.asset('assets/weplay_horizontal_logo.png'),
        ),
      ),
    );
  }
}
