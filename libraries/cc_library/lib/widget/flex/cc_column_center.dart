import 'package:flutter/cupertino.dart';

class CcColCenter extends StatelessWidget {
  const CcColCenter({Key? key, required this.children, this.flex}) : super(key: key);

  final flex;

  final List<Widget> children;

  @override
  Widget build(c) => flex != null
      ? Flexible(
          flex: flex,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        )
      : getColumn();

  Widget getColumn() => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
}
