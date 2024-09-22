import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// POPULAR WIDGET
/// Feature : prevent many clicks in one time
/// able use either of these ways :
/// - Way 1 : include InkWellSafe widget, is inside of destination widget. ex. : ScanBarcodeButton ...
/// - Way 2 : BaseUtils.preventClickSoFast(Function f)
/// NOTICE : in case duplicate onTap() method, can only use Way 2
class InkWellSafe extends StatefulWidget {
  const InkWellSafe({
    Key? key,
    required this.onTap,
    this.interval = 700,
    required this.child,
  }) : super(key: key);

  final VoidCallback onTap;

  final int interval;

  final Widget child;

  @override
  _InkWellSafeState createState() => _InkWellSafeState();
}

class _InkWellSafeState extends State<InkWellSafe> {
  final RxInt lastTimeClicked = 0.obs;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          final now = DateTime.now().millisecondsSinceEpoch;

          if (now - lastTimeClicked.value < widget.interval) {
            return;
          }

          lastTimeClicked.value = now;

          widget.onTap();
        },
        child: widget.child,
      );
}
