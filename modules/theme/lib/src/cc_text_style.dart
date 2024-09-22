import 'package:flutter/material.dart';

/// It designs for Text Widget.
/// NOTICE : for Designer only, MUST follow rule :
/// [Design text style rule for mobile devices, follow material design](https://material.io/blog/design-material-theme-type),
/// for Developer only, have to read-only if already existed,
class CcTextStyle {
  static const TextStyle headline1 = TextStyle(
    debugLabel: 'headline1',
    inherit: true,
    color: Colors.black54,
    decoration: TextDecoration.none,
    fontSize: 96,
    letterSpacing: -1.5,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle headline2 = TextStyle(
    debugLabel: 'headline2',
    inherit: true,
    color: Colors.black54,
    decoration: TextDecoration.none,
    fontSize: 60,
    letterSpacing: -0.5,
    fontStyle: FontStyle.normal,
  );
  static const TextStyle headline3 = TextStyle(
    debugLabel: 'headline3',
    inherit: true,
    color: Colors.black54,
    decoration: TextDecoration.none,
    fontSize: 48,
    letterSpacing: 0,
    fontStyle: FontStyle.normal,
  );
  static const TextStyle headline4 = TextStyle(
    debugLabel: 'headline4',
    inherit: true,
    color: Colors.black54,
    decoration: TextDecoration.none,
    fontSize: 34,
    letterSpacing: 0.25,
    fontStyle: FontStyle.normal,
  );
  static const TextStyle headline5 = TextStyle(
    debugLabel: 'headline5',
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
    fontSize: 24,
    letterSpacing: 0.0,
    fontStyle: FontStyle.normal,
  );
  static const TextStyle headline6 = TextStyle(
    debugLabel: 'headline6',
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
    fontSize: 20,
    letterSpacing: 0.15,
    fontStyle: FontStyle.normal,
  );
  static const TextStyle subtitle1 = TextStyle(
    debugLabel: 'subtitle1',
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
    fontSize: 16,
    letterSpacing: 0.15,
    fontStyle: FontStyle.normal,
  );
  static const TextStyle subtitle2 = TextStyle(
    debugLabel: 'subtitle2',
    inherit: true,
    color: Colors.black,
    decoration: TextDecoration.none,
    fontSize: 14,
    letterSpacing: 0.1,
    fontStyle: FontStyle.normal,
  );

  /// Body Text 1 : start.
  static const TextStyle bodyText1 = TextStyle(
    debugLabel: 'bodyText1',
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
    fontSize: 16,
    letterSpacing: 0.5,
    fontStyle: FontStyle.normal,
  );

  /// Body Text 1 : end.
  static const TextStyle bodyText2 = TextStyle(
    debugLabel: 'bodyText2',
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
    fontSize: 14,
    letterSpacing: 0.25,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle button = TextStyle(
    debugLabel: 'button',
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
    fontSize: 14,
    letterSpacing: 1.25,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle caption = TextStyle(
    debugLabel: 'caption',
    inherit: true,
    color: Colors.black54,
    decoration: TextDecoration.none,
    fontSize: 12,
    letterSpacing: 0.4,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle overline = TextStyle(
    debugLabel: 'overline',
    inherit: true,
    color: Colors.black,
    decoration: TextDecoration.none,
    fontSize: 10,
    letterSpacing: 1.5,
    fontStyle: FontStyle.normal,
  );
}
