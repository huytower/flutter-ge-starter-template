library theme;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme/src/prj_color.dart';

/// Colors from Tailwind CSS :
/// https://tailwindcss.com/docs/customizing-colors
///
/// Font size guideline :
/// https://material.io/blog/design-material-theme-type
///

class CcThemes {
  static final int _primaryColor = PrjColors.blue.value;

  static FontStyle? fontStyle = GoogleFonts.roboto().fontStyle;
  static String? fontFamily = GoogleFonts.roboto().fontFamily;

  static TextTheme? textTheme;
  static MaterialColor primarySwatch = MaterialColor(_primaryColor, <int, Color>{
    50: PrjColors.primary.withOpacity(
      0.1,
    ),
    100: PrjColors.primary.withOpacity(
      0.2,
    ),
    200: PrjColors.primary.withOpacity(
      0.3,
    ),
    300: PrjColors.primary.withOpacity(
      0.4,
    ),
    400: PrjColors.primary.withOpacity(
      0.5,
    ),
    500: PrjColors.primary.withOpacity(
      0.6,
    ),
    600: PrjColors.primary.withOpacity(
      0.7,
    ),
    700: PrjColors.primary.withOpacity(
      0.8,
    ),
    800: PrjColors.primary.withOpacity(
      0.9,
    ),
    900: PrjColors.primary.withOpacity(
      1,
    ),
  });

  static const int _textColor = 0xFF6B7280;
  static MaterialColor textSwatch = MaterialColor(
    _textColor,
    <int, Color>{
      50: PrjColors.primary.withOpacity(
        0.1,
      ),
      100: PrjColors.primary.withOpacity(
        0.2,
      ),
      200: PrjColors.primary.withOpacity(
        0.3,
      ),
      300: PrjColors.primary.withOpacity(
        0.4,
      ),
      400: PrjColors.primary.withOpacity(
        0.5,
      ),
      500: PrjColors.primary.withOpacity(
        0.6,
      ),
      600: PrjColors.primary.withOpacity(
        0.7,
      ),
      700: PrjColors.primary.withOpacity(
        0.8,
      ),
      800: PrjColors.primary.withOpacity(
        0.9,
      ),
      900: PrjColors.primary.withOpacity(
        1,
      ),
    },
  );

  static final lightTheme = ThemeData(
    unselectedWidgetColor: PrjColors.secondary,
    primarySwatch: primarySwatch,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light().copyWith(
      primary: PrjColors.secondary,
    ),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.black,
    dividerColor: PrjColorsSimple.divider,
    fontFamily: fontFamily,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
  );

  static final darkTheme = lightTheme.copyWith(
    unselectedWidgetColor: PrjColors.secondary,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: PrjColors.secondary,
    ),
    scaffoldBackgroundColor: Colors.white,
    cardColor: const Color(
      0xFF2f2f34,
    ),
    dividerColor: const Color(
      0x1CFFFFFF,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );
}
