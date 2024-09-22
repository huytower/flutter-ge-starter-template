import 'package:flutter/material.dart';
import 'package:theme/src/prj_color.dart';

class NotFondScreen extends StatelessWidget {
  const NotFondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PrjColorsSimple.red,
      ),
    );
  }
}
