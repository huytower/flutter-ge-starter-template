import 'package:flutter/material.dart';

class CcExpansionPane extends StatefulWidget {
  final Widget collapse;
  final Widget expand;
  final Duration duration;
  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final bool initiallyExpanded;

  const CcExpansionPane({
    Key? key,
    required this.collapse,
    required this.expand,
    this.duration = const Duration(milliseconds: 200),
    this.backgroundColor = Colors.white,
    this.borderRadius,
    this.initiallyExpanded = false,
  }) : super(key: key);

  @override
  _ExpansionPaneState createState() => _ExpansionPaneState();
}

class _ExpansionPaneState extends State<CcExpansionPane> {
  var rotate = 1;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      child: ExpansionTile(
        controlAffinity: ListTileControlAffinity.trailing,
        initiallyExpanded: widget.initiallyExpanded,
        backgroundColor: widget.backgroundColor,
        trailing: RotatedBox(
          quarterTurns: rotate,
          child: SizedBox(
            child: Image.asset(
              "packages/theme/assets/images/ic_right.png",
            ),
            height: 15,
            width: 15,
          ),
        ),
        tilePadding: const EdgeInsets.only(
          right: 12,
        ),
        childrenPadding: EdgeInsets.zero,
        title: widget.collapse,
        children: [widget.expand],
        onExpansionChanged: (value) {
          setState(() {
            if (value) {
              rotate = -1;
            } else {
              rotate = 1;
            }
          });
        },
      ),
    );
  }
}
