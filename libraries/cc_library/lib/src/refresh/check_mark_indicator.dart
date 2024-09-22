// import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// class CheckMarkIndicator extends StatefulWidget {
//   final Widget child;
//   final Color backgroundColor;
//   final double indicatorSize;
//   final OnRefresh? onRefresh;
//   final Duration? completeStateDuration;
//
//   const CheckMarkIndicator(
//       {Key? key,
//       required this.child,
//       this.backgroundColor = Colors.blue,
//       this.indicatorSize = 60.0,
//       this.onRefresh,
//       this.completeStateDuration = const Duration(milliseconds: 500)})
//       : super(key: key);
//
//   @override
//   _CheckMarkIndicatorState createState() => _CheckMarkIndicatorState();
// }
//
// class _CheckMarkIndicatorState extends State<CheckMarkIndicator>
//     with SingleTickerProviderStateMixin {
//   final _helper = IndicatorStateHelper();
//
//   /// Whether to render check mark instead of spinner
//   bool _renderCompleteState = false;
//   ScrollDirection prevScrollDirection = ScrollDirection.idle;
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomRefreshIndicator(
//       offsetToArmed: widget.indicatorSize,
//       onRefresh:
//           widget.onRefresh ?? () => Future.delayed(const Duration(seconds: 1)),
//       child: widget.child,
//       completeStateDuration: widget.completeStateDuration,
//       builder: (
//         BuildContext context,
//         Widget child,
//         IndicatorController controller,
//       ) {
//         return Stack(
//           children: <Widget>[
//             AnimatedBuilder(
//               animation: controller,
//               builder: (BuildContext context, Widget? _) {
//                 _helper.update(controller.state);
//                 if (controller.scrollingDirection == ScrollDirection.reverse &&
//                     prevScrollDirection == ScrollDirection.forward) {
//                   controller.stopDrag();
//                 }
//                 prevScrollDirection = controller.scrollingDirection;
//
//                 /// set [_renderCompleteState] to true when controller.state become completed
//                 if (_helper.didStateChange(to: IndicatorState.armed)) {
//                   _renderCompleteState = true;
//
//                   /// set [_renderCompleteState] to false when controller.state become idle
//                 } else if (_helper.didStateChange(to: IndicatorState.idle)) {
//                   _renderCompleteState = false;
//                 }
//                 final containerHeight = controller.value * widget.indicatorSize;
//                 return Container(
//                   alignment: Alignment.center,
//                   height: containerHeight,
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 150),
//                     alignment: Alignment.center,
//                     color: widget.backgroundColor,
//                     // child: when(
//                     //   equal: {
//                     //     _renderCompleteState: const SpinKitThreeBounce(
//                     //       color: Colors.white,
//                     //       size: 20,
//                     //     ),
//                     //   },
//                     //   onDefault: const Icon(
//                     //     Icons.arrow_downward_outlined,
//                     //     color: Colors.white,
//                     //   ),
//                     // ),
//                   ),
//                 );
//               },
//             ),
//             AnimatedBuilder(
//               builder: (context, _) {
//                 return Transform.translate(
//                   offset: Offset(0.0, controller.value * widget.indicatorSize),
//                   child: child,
//                 );
//               },
//               animation: controller,
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
