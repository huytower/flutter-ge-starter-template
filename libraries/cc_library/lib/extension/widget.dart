import 'package:flutter/material.dart';

///
///
///
///
///
extension WidgetExtension on Widget {
  Widget visibleWhen(bool condition()) {
    return Visibility(
      child: this,
      visible: condition(),
    );
  }
}
