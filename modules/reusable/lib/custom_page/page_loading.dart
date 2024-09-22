import 'package:flutter/cupertino.dart';
import 'package:widget/export/cc_ui_export.dart';

class PageLoading extends StatelessWidget {
  const PageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // decoration: BoxDecoration(
        //   borderRadius: const BorderRadius.all(Radius.circular(7)),
        //   color: Colors.grey.withOpacity(0.1),
        // ),
        height: 50,
        width: 50,
        child: const CupertinoActivityIndicator(
          radius: 15,
          color: PrjColorsSimple.black,
        ),
      ),
    );
  }
}
