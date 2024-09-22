import '../../../../structure/getx/cc_get_view/cc_get_view.dart';
import '../getx/get_view_controller.dart';
import 'package:flutter/material.dart';

/// GETX : UI app bar
/// Step 4 : if has or need customize app bar, implement as mixin|provider
///
mixin GetViewProvider<T extends GetViewController> on CcGetView<T> {
  //----------------------------------------------------------------------------
  @override
  PreferredSizeWidget? appBar() {
    return AppBar(
      title: const Text("Get View page"),
      backgroundColor: Colors.pinkAccent,
    );
  }

  //----------------------------------------------------------------------------
  @override
  Widget? bottomNavigationBar() {
    return Container(
      height: 70,
      color: Colors.blue,
      child: const Center(
        child: Text(
          "Bottom Navigation Bar..",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  //----------------------------------------------------------------------------
  @override
  Widget errorLayout(String code) {
    return Container(
      height: 150,
      color: Colors.red,
      margin: const EdgeInsets.only(bottom: 15),
    );
  }

  //----------------------------------------------------------------------------
  @override
  Widget loadingLayout() {
    return Container(
      height: 100,
      width: 100,
      color: Colors.yellow,
      child: const Center(
        child: Text("Loading..."),
      ),
    );
  }
//----------------------------------------------------------------------------
}
