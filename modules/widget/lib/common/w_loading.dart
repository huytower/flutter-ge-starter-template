import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../export/cc_ui_export.dart';

class wLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(7.0)),
            color: PrjColors.grey300,
          ),
          height: 50,
          width: 50,
          child: CupertinoActivityIndicator(
            radius: 12,
          ),
        ),
      ),
    );
  }
}
