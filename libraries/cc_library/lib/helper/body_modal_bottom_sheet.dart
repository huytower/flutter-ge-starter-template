import 'package:flutter/cupertino.dart';

class BodyModalBottomSheet extends StatelessWidget {
  final Widget? w;

  const BodyModalBottomSheet({Key? key, this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double heightKeyboard = MediaQuery.of(context).viewInsets.bottom;
    // double heightKeyboard = SettingDevice.getHeightKeyBoard();//MediaQuery.of(context).viewInsets.bottom

    return SingleChildScrollView(
      child: Container(
        // padding: EdgeInsets.only(
        //   bottom: heightKeyboard,
        // ),
        child: w,
      ),
    );
  }
}
