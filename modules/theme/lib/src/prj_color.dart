import 'package:flutter/material.dart';

import 'hex_color.dart';

/// [Where design find color name](https://colors.artyclick.com/color-name-finder/)
/// ex. : #194109
///
/// [After picked color ex. #194109, need convert to hex color using for
/// mobile devices](https://convertingcolors.com/android-color-4284900966.html)
/// ex. : [#194109] => [Android (android.graphics.Color),  0xFF194109]
///
/// [Setup themes planning rule, included : color, text size, .v.v](https://pub.dev/packages/flex_color_scheme)
/// ex. : dark theme, light theme .v.v.
///
/// Opacity|Alpha|Transparent calculator :
///   - Step 1 : specify opacity, ex. `80% = 0.8`
///   - Step 2 : calculate it, ex. : `255 * 0.8 = 204`
///   - Step 3 : convert int to hex color, ex : `204 = 0xCC`
///   - Step 4 : paste as var., ex : `static const Color gray_80 = Color(0xCCE2E2E2);`
class PrjColors {
  /// Prj. colors
  static Color pinkAppbarPrimary = HexColor("#EE3E80"); //e13475
  static Color pinkPrimary = HexColor("#e94583");
  static Color pinkPrimary1 = HexColor("#EE3E80");
  static Color pinkEF3F81 = HexColor("#EF3F81");

  static Color pinkActive = HexColor("#f45991");
  static Color pinkDisable = HexColor("#ec92b4");

  static Color grayNormal = HexColor("#f3f3f3");
  static Color blackActive = HexColor("#454545");
  static Color black333333 = HexColor("#333333");
  static Color black232323 = HexColor("#232323");
  static Color blackNormal = HexColor("#888888");
  static Color black14c111111 = HexColor("#111111");

  static Color primary = HexColor("#007bff");
  static Color secondary = HexColor("#6c757d");
  static Color success = HexColor("#28a745");
  static Color danger = HexColor("#dc3545");
  static Color dangerFFDADA = HexColor("#FFDADA");
  static Color warning = HexColor("#ffc107");
  static Color info = HexColor("#17a2b8");
  static Color light = HexColor("#f8f9fa");
  static Color dark = HexColor("#343a40");
  static Color muted = HexColor("#343a40");

  static Color fail = HexColor("#8F8F8F");
  static Color confirm = HexColor("#0C87F9");
  static Color cancel = HexColor("#de4010");

  static Color background = Colors.white;
  static Color backgroundGrey = Colors.grey.withOpacity(0.1);
  static Color grey = HexColor("#8F8F8F");
  static Color grey666666 = HexColor("#666666");
  static Color greyEEEEEE = HexColor("#EEEEEE");
  static Color greyLower = HexColor("#D7D7D7");
  static Color grey300 = Colors.grey.withOpacity(0.4);
  static Color grey700 = Colors.grey.withOpacity(0.7);

  static Color black = HexColor("#232323");
  static Color blue = HexColor("#3163DA");
  static Color blue3567D7 = HexColor("#3567D7");
  static Color pinkLower = HexColor("#f45991");
}

class PrjColorsSimple {
  /// Material-Color
  static const Color primary = Color(0xFF00296B);
  static const Color primaryVariant = Color(0xFF2F5C91);
  static const Color secondary = Color(0xFFFF7B00);
  static const Color secondaryVariant = Color(0xFFFDB100);

  static const Color primaryDart = Color(0xff001d4b);
  static const Color primaryLight = Color(0xff667fa6);
  static const Color divider = Color(0x1e000000);
  static const Color disable = Color(0x31001840);

  static const Color background = Colors.white;
  static const Color error = Colors.red;

  static const Color notice = Color(0xffff3f34);
  static const Color focus = Color(0x1500c44b);

  // Single-Color
  static const Color black = Colors.black;
  static Color black_5 = Colors.black.withOpacity(0.05);
  static Color black_10 = Colors.black.withOpacity(0.1);
  static Color black_20 = Colors.black.withOpacity(0.2);
  static Color black_30 = Colors.black.withOpacity(0.3);
  static Color black_40 = Colors.black.withOpacity(0.4);
  static Color black_50 = Colors.black.withOpacity(0.5);
  static Color black_70 = Colors.black.withOpacity(0.7);

  static const Color blue = Color(0xFF1565C0);

  static const Color gray = Colors.grey;

  static const Color pink = Color(0xFFEE3E80);

  static const Color red = Colors.red;

  static const Color transparent = Colors.transparent;

  static const Color warning = Color(0xFFFDB100);

  static const Color white = Colors.white;
  static Color white_10 = Colors.white.withOpacity(0.1);
  static Color white_15 = Colors.white.withOpacity(0.15);
  static Color white_20 = Colors.white.withOpacity(0.2);
  static Color white_30 = Colors.white.withOpacity(0.3);
  static Color white_40 = Colors.white.withOpacity(0.4);
  static Color white_50 = Colors.white.withOpacity(0.5);
  static Color white_70 = Colors.white.withOpacity(0.7);
  static Color white_80 = Colors.white.withOpacity(0.8);
}
