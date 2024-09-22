import 'package:flutter/material.dart';

class IgnoreKeyboard extends StatelessWidget {
  final Widget? child;
  final void Function()? onIgnoreFocus;

  const IgnoreKeyboard({
    this.child,
    this.onIgnoreFocus,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
        if (onIgnoreFocus != null) {
          onIgnoreFocus!();
        }
      },
      child: child,
    );
  }
}
