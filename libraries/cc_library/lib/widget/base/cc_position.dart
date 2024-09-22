import 'package:flutter/cupertino.dart';

class CcPositionBottom extends StatelessWidget {
  const CcPositionBottom({Key? key, required this.child, this.bottom}) : super(key: key);

  final double? bottom;
  final Widget child;

  @override
  Widget build(c) => Positioned(
        bottom: bottom ?? 0,
        left: 0,
        right: 0,
        child: child,
      );
}

class CcPositionCenter extends StatelessWidget {
  const CcPositionCenter({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(c) => Positioned.fill(
        child: child,
      );
}

class CcPositionRight extends StatelessWidget {
  const CcPositionRight({Key? key, required this.child, this.right}) : super(key: key);

  final double? right;
  final Widget child;

  @override
  Widget build(c) => Positioned(
        bottom: 0,
        right: right ?? 0,
        top: 0,
        child: child,
      );
}

class CcPositionTop extends StatelessWidget {
  const CcPositionTop({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(c) => Positioned(
        left: 0,
        right: 0,
        top: 0,
        child: child,
      );
}
