import 'package:flutter/material.dart';

class CcRowBetween extends StatelessWidget {
  const CcRowBetween({Key? key, required this.children, this.flex, this.align}) : super(key: key);

  final flex;

  final MainAxisAlignment? align;

  final List<Widget> children;

  @override
  Widget build(c) => flex != null
      ? Flexible(
          flex: flex,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: align ?? MainAxisAlignment.spaceBetween,
            children: children,
          ),
        )
      : getView();

  Widget getView() => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: align ?? MainAxisAlignment.spaceBetween,
        children: children,
      );
}
