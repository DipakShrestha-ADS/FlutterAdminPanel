import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weplay_admin/view/viewUtils/color_utils.dart';

enum ThemeType {
  TiffinBlue,
  TiffinBlue_Dark,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.TiffinBlue;

  bool isDark;
  Color bg1; //
  Color surface; //
  Color bg2;
  Color accent1;
  Color accent1Dark;
  Color accent1DarkTransparent;
  Color accent1Darker;
  Color accent2;
  Color accent3;
  Color grey;
  Color greyStrong;
  Color greyWeak;
  Color error;
  Color focus;

  Color txt;
  Color accentTxt;

  /// Default constructor
  AppTheme({@required this.isDark}) {
    txt = isDark ? Colors.white : Colors.black;
    accentTxt = accentTxt ?? isDark ? Colors.black : Colors.white;
  }

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    Color c(String value) => ColorUtils.parseHex(value);
    switch (t) {
      case ThemeType.TiffinBlue:
        return AppTheme(isDark: false)
          ..bg1 = Color(0xffECF0F5)
          ..bg2 = Color(0xffb9c9eb)
          ..surface = Colors.white
          ..accent1 = Colors.blue
          ..accent1Dark = Color(0xff2A7DBE)
          ..accent1DarkTransparent = Color(0x992A7DBE)
          ..accent1Darker = Color(0xff1b5693)
          //..accent2 = Color(0xffB48518)
          ..accent2 = Colors.black54
          ..accent3 = Color(0xff1ec75a)
          ..greyWeak = Color(0xff909f9c)
          ..grey = Color(0xff515d5a)
          ..greyStrong = Color(0xff151918)
          ..error = Color(0xffBE020A)
          ..focus = Color(0xFF00B4C0);

      case ThemeType.TiffinBlue_Dark:
        return AppTheme(isDark: true)
          ..bg1 = Color(0xff121212)
          ..bg2 = Color(0xff2c2c2c)
          ..surface = Color(0xff252525)
          ..accent1 = Color(0xff00a086)
          ..accent1Dark = Color(0xff00caa5)
          ..accent1DarkTransparent = Color(0x992A7DBE)
          ..accent1Darker = Color(0xff00caa5)
          ..accent2 = Color(0xfff19e46)
          ..accent3 = Color(0xff5BC91A)
          ..greyWeak = Color(0xffa8b3b0)
          ..grey = Color(0xffced4d3)
          ..greyStrong = Color(0xffffffff)
          ..error = Color(0xffe55642)
          ..focus = Color(0xff0ee2b1);
      /*
           case ThemeType.TiffinBlue_Dark:
        return AppTheme(isDark: true)
          ..bg1 = Color(0xff212529)
          ..surface = Color(0xff2a2e32)
          ..bg2 = Color(0xff272b2f)
          ..accent1 = Color(0xff00a086)
          ..accent1Dark = Color(0xff00856f)
          ..accent1Darker = Color(0xff006b5a)
          ..accent2 = Color(0xfff09433)
          ..accent3 = Color(0xff5bc91a)
          ..greyWeak = Color(0xff151918)
          ..grey = Color(0xff6c6c6c)
          ..greyStrong = Color(0xff909f9c)
          ..error = Colors.red.shade900
          ..focus = Color(0xb30ee2b1);
         */
    }
    return AppTheme.fromType(defaultTheme);
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      colorScheme: ColorScheme(brightness: isDark ? Brightness.dark : Brightness.light, primary: accent1, primaryVariant: accent1Darker, secondary: accent2, secondaryVariant: ColorUtils.shiftHsl(accent2, -.2), background: bg1, surface: surface, onBackground: txt, onSurface: txt, onError: txt, onPrimary: accentTxt, onSecondary: accentTxt, error: error ?? Colors.red.shade400),
    );
    return t.copyWith(
        inputDecorationTheme: InputDecorationTheme(
          border: ThinUnderlineBorder(),
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textSelectionColor: greyWeak,
        textSelectionHandleColor: Colors.transparent,
        buttonColor: accent1,
        cursorColor: accent1,
        highlightColor: accent1,
        toggleableActiveColor: accent1);
  }

  Color shift(Color c, double d) => ColorUtils.shiftHsl(c, d * (isDark ? -1 : 1));
}

class ThinUnderlineBorder extends InputBorder {
  /// Creates an underline border for an [InputDecorator].
  ///
  /// The [borderSide] parameter defaults to [BorderSide.none] (it must not be
  /// null). Applications typically do not specify a [borderSide] parameter
  /// because the input decorator substitutes its own, using [copyWith], based
  /// on the current theme and [InputDecorator.isFocused].
  ///
  /// The [borderRadius] parameter defaults to a value where the top left
  /// and right corners have a circular radius of 4.0. The [borderRadius]
  /// parameter must not be null.
  const ThinUnderlineBorder({
    BorderSide borderSide = const BorderSide(),
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(4.0),
      topRight: Radius.circular(4.0),
    ),
  })  : assert(borderRadius != null),
        super(borderSide: borderSide);

  /// The radii of the border's rounded rectangle corners.
  ///
  /// When this border is used with a filled input decorator, see
  /// [InputDecoration.filled], the border radius defines the shape
  /// of the background fill as well as the bottom left and right
  /// edges of the underline itself.
  ///
  /// By default the top right and top left corners have a circular radius
  /// of 4.0.
  final BorderRadius borderRadius;

  @override
  bool get isOutline => false;

  @override
  UnderlineInputBorder copyWith({BorderSide borderSide, BorderRadius borderRadius}) {
    return UnderlineInputBorder(
      borderSide: borderSide ?? this.borderSide,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.only(bottom: borderSide.width);
  }

  @override
  UnderlineInputBorder scale(double t) {
    return UnderlineInputBorder(borderSide: borderSide.scale(t));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return Path()..addRect(Rect.fromLTWH(rect.left, rect.top, rect.width, math.max(0.0, rect.height - borderSide.width)));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  ShapeBorder lerpFrom(ShapeBorder a, double t) {
    if (a is UnderlineInputBorder) {
      return UnderlineInputBorder(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder lerpTo(ShapeBorder b, double t) {
    if (b is UnderlineInputBorder) {
      return UnderlineInputBorder(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t),
      );
    }
    return super.lerpTo(b, t);
  }

  /// Draw a horizontal line at the bottom of [rect].
  ///
  /// The [borderSide] defines the line's color and weight. The `textDirection`
  /// `gap` and `textDirection` parameters are ignored.
  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection textDirection,
  }) {
    print("Width: ${borderSide.width}");
    if (borderRadius.bottomLeft != Radius.zero || borderRadius.bottomRight != Radius.zero) canvas.clipPath(getOuterPath(rect, textDirection: textDirection));
    canvas.drawLine(rect.bottomLeft, rect.bottomRight, borderSide.toPaint());
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is InputBorder && other.borderSide == borderSide;
  }

  @override
  int get hashCode => borderSide.hashCode;
}
