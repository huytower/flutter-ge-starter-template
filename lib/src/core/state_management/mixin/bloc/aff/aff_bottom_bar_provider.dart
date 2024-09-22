// import 'package:Template/src/core/state_management/bloc_base.dart';
// import 'package:Template/src/core/state_management/state_base.dart';
// import 'package:flutter/material.dart';
//
// mixin AffBottomBarProvider<T extends StatefulWidget, B extends BlocBase> on StateBloc<T, B> {
//   List<Widget> customBottomBar();
//
//   @override
//   CustomBottomNavigator? bottomNavigatorWidget() {
//     var customNavigator = CustomBottomNavigator();
//     customNavigator.bottomNavigator = Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: customBottomBar(),
//     );
//     return customNavigator;
//   }
//
//   @override
//   Widget leadingWidget() {
//     return Container(
//       margin: const EdgeInsets.only(left: 15),
//       alignment: Alignment.centerLeft,
//       child: SizedBox(
//         height: leadingWidth,
//         width: leadingWidth,
//         child: InkWell(
//           child: toolBar.leadWidget ??
//               Image.asset(
//                 "packages/theme/assets/images/ic_back.png",
//               ),
//           onTap: () {
//             onBackPressed();
//           },
//         ),
//       ),
//     );
//   }
// }
