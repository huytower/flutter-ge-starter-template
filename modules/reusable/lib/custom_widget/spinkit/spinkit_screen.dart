import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:theme/src/prj_color.dart';
import 'package:widget/export/cc_ui_export.dart';

class SpinKitScreen extends StatefulWidget {
  const SpinKitScreen({Key? key}) : super(key: key);

  @override
  _SpinKitState createState() => _SpinKitState();
}

class _SpinKitState extends State<SpinKitScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SpinKitThreeBounce(
              color: PrjColors.primary,
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}
