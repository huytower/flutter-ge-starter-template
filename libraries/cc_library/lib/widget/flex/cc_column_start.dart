import 'package:flutter/material.dart';

class CcColStart extends StatelessWidget {
  const CcColStart({Key? key, required this.children, this.flex}) : super(key: key);

  final flex;

  final List<Widget> children;

  @override
  Widget build(c) => flex != null
      ? Flexible(
          flex: flex,
          child: getColumn(),
        )
      : getColumn();

  Widget getColumn() => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      );
}
