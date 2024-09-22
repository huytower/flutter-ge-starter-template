import 'package:cc_library/widget/base/cc_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

/// Widget use to hide keyboard when click on content widget :
/// - background widget, is total background page
/// - content widget, is total body page, ex. page Home .v.v.
/// - boolean allow scroll total body page or not, default = true
class IgnoreKeyboardV2 extends StatelessWidget {
  const IgnoreKeyboardV2({
    Key? key,
    this.background,
    required this.content,
    this.isScrollBodyEnable = false,
  })

  /// disable scroll as default
  : super(key: key);

  final Widget? background;
  final Widget content;

  final isScrollBodyEnable;

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          backgroundColor: Colors.transparent,

          /// MUST set to avoid collapse showing screen
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              /// Section : Background widget
              background ?? const SizedBox(),

              /// Section : Body widget - Content widget
              isScrollBodyEnable ? CcScrollView(child: content) : content,
            ],
          ),
        ),
      );
}
