// import 'package:Template/src/core/state_management/bloc_base.dart';
// import 'package:Template/src/core/state_management/state_base.dart';
// import 'package:flutter/material.dart';
//
// mixin HomeProvider<T extends StatefulWidget, B extends BlocBase> on StateBloc<T, B> {
//   @override
//   CustomBottomNavigator? bottomNavigatorWidget() {
//     var customNavigator = CustomBottomNavigator();
//     customNavigator.bottomNavigator = Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Expanded(
//           child: Container(
//             height: 30,
//             width: 30,
//             margin: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
//             child: Image.asset(
//               "packages/theme/assets/images/home/ic_notify_aff.png",
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 60,
//         ),
//         Expanded(
//           child: Container(
//             height: 22,
//             width: 22,
//             margin: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
//             child: Image.asset(
//               "packages/theme/assets/images/home/ic_extension_aff.png",
//             ),
//           ),
//         )
//       ],
//     );
//     customNavigator.floating = FloatingActionButton(
//       onPressed: () {},
//       backgroundColor: Colors.transparent,
//       child: Container(
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(40)),
//           color: Colors.blue,
//         ),
//         padding: const EdgeInsets.all(5),
//         child: SizedBox(
//           child: Image.asset(
//             "packages/theme/assets/images/home/ic_home_aff.png",
//           ),
//           height: 50,
//           width: 50,
//         ),
//       ),
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
