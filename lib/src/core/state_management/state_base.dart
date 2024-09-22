// import 'dart:io' show Platform;
//
// import 'package:Template/src/core/di/app_inject.dart';
// import 'package:Template/src/core/state_management/bloc_base.dart';
// import 'package:app_config/enum/layout_status.dart';
// import 'package:data/config/retrofit/response/cc_response.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:theme/src/prj_color.dart';
// import 'package:widget/export/cc_ktx_export.dart';
// import 'package:widget/multipe_status/error_screen.dart';
//
// export 'package:theme/cc_themes.dart';
//
// abstract class StateBloc<T extends StatefulWidget, B extends BlocBase> extends StateBase<T> {
//   late var bloc = getIt<B>();
//
//   StateBloc({
//     LayoutStatus layoutState = LayoutStatus.success,
//     bool enableToolBar = false,
//     bool enableBottomNavigator = false,
//     bool enableTabBar = false,
//   }) : super(
//           layoutState: layoutState,
//           enableToolBar: enableToolBar,
//           enableBottomNavigator: enableBottomNavigator,
//           enableTabBar: enableTabBar,
//         );
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
// }
//
// abstract class StateBase<T extends StatefulWidget> extends State<T> with SingleTickerProviderStateMixin {
//   StateBase({
//     this.enableToolBar = false,
//     this.enableBottomNavigator = false,
//     this.enableTabBar = false,
//     this.layoutState = LayoutStatus.success,
//   }) {
//     if (layoutState != LayoutStatus.success) {
//       _multiLayoutStatus.value = layoutState;
//     }
//   }
//
//   bool? isLogger = false;
//   late ThemeData theme;
//   late TextTheme textTheme;
//   late BuildContext requestContext;
//
//   var _isInitBuild = true;
//   bool enableToolBar = false;
//   bool enableTabBar = false;
//   bool enableBottomNavigator = false;
//   bool isAndroid = true;
//
//   double leadingWidth = 40;
//   CustomToolBar toolBar = CustomToolBar();
//   final LayoutStatus layoutState;
//   CcResponse? response;
//   final _multiLayoutStatus = ValueNotifier<LayoutStatus>(LayoutStatus.success);
//
//   setLayoutStatus(LayoutStatus LayoutStatus) {
//     //_multiLayoutStatus.value = LayoutStatus;
//   }
//
//   setResponse(CcResponse response) {
//     this.response = response;
//     //_multiLayoutStatus.value = response.LayoutStatus;
//   }
//
//   CustomBottomNavigator? bottomNavigatorWidget() {
//     return null;
//   }
//
//   Widget? leadingWidget() {
//     return null;
//   }
//
//   Widget futureMultipleLayoutStatus<R extends CcResponse>({
//     required Future<R>? response,
//     required Widget Function(R? data) builder,
//   }) {
//     R? result;
//     response?.then((value) {
//       // _multiLayoutStatus.value = value.LayoutStatus;
//       result = value;
//     });
//     return ValueListenableBuilder(
//       valueListenable: _multiLayoutStatus,
//       builder: (BuildContext context, LayoutStatus value, Widget? _child) {
//         return Stack(
//           children: [
//             Visibility(
//               child: builder(result),
//               visible: value == LayoutStatus.success,
//             ),
//             Visibility(
//               child: Container(), //const SpinKitScreen(),
//               visible: value == LayoutStatus.loading,
//             ),
//             Visibility(
//               child: const ErrorScreen(),
//               visible: value == LayoutStatus.error,
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void customToolBar(CustomToolBar _toolBar) {
//     toolBar.leadWidget = _toolBar.leadWidget;
//     toolBar.actionWidget = _toolBar.actionWidget;
//     toolBar.onClickAction = _toolBar.onClickAction;
//     toolBar.title = _toolBar.title ?? "title";
//     toolBar.hideStatusBar = _toolBar.hideStatusBar ?? false;
//     toolBar.pinned = _toolBar.pinned ?? false;
//     toolBar.tabs = _toolBar.tabs ?? [];
//   }
//
//   /// [onBackPressed] registers a callback when press back.
//   /// return true to back.
//   Future<bool> onBackPressed() async {
//     Navigator.of(context).pop();
//     return true;
//   }
//
//   void _getLogger(String content) {
//     if (isLogger == true) {
//       content.Log();
//     }
//   }
//
//   @override
//   void initState() {
//     _getLogger("initState:...");
//     super.initState();
//     customToolBar(toolBar);
//
//     if (toolBar.hideStatusBar == true) {
//       SystemChrome.setSystemUIOverlayStyle(
//         const SystemUiOverlayStyle(
//           statusBarColor: Colors.transparent,
//         ),
//       );
//     }
//     if (enableTabBar) {
//       controllerTabBar = TabController(length: toolBar.tabs?.length ?? 0, vsync: this);
//     }
//
//     isAndroid = Platform.isAndroid;
//     if (isAndroid) {
//       toolBar.pinned == false;
//       leadingWidth = 40;
//       toolBarHeight = kToolbarHeight;
//     } else {
//       toolBar.pinned == true;
//       leadingWidth = 30;
//       toolBarHeight = 44;
//       enableTabBar = false;
//     }
//   }
//
//   @override
//   void didChangeDependencies() {
//     _getLogger("didChangeDependencies:...");
//     super.didChangeDependencies();
//   }
//
//   @override
//   void reassemble() {
//     _getLogger("reassemble:...");
//     _isInitBuild = true;
//     super.reassemble();
//   }
//
//   /// [initBuild] start when hot read and first build.
//   @protected
//   @mustCallSuper
//   Future initBuild(BuildContext context) async {
//     _isInitBuild = false;
//   }
//
//   /// [childBuild] is a child widget of [Build].
//   @protected
//   Widget childBuild(BuildContext context);
//
//   @override
//   Widget build(BuildContext context) {
//     _getLogger("build:...");
//     if (_isInitBuild) {
//       initBuild(context).then((value) {});
//       _initTheme();
//       _isInitBuild = false;
//       requestContext = context;
//     }
//     if (enableToolBar == true || enableBottomNavigator == true) {
//       return _body(childBuild(context));
//     } else {
//       return childBuild(context);
//     }
//   }
//
//   _initTheme() {
//     theme = Theme.of(context);
//     textTheme = theme.textTheme;
//   }
//
//   //----------------------------------------------------------------------------
//   TabController? controllerTabBar;
//   Color statusBar = Colors.white;
//   double toolBarHeight = kToolbarHeight;
//
//   Widget _body(Widget content) {
//     var _bottomNavigator = bottomNavigatorWidget();
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: WillPopScope(
//         onWillPop: () => onBackPressed(),
//         child: enableToolBar
//             ? NestedScrollView(
//                 headerSliverBuilder: (context, innerBoxIsScrolled) {
//                   return <Widget>[
//                     SliverOverlapAbsorber(
//                       handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
//                         context,
//                       ),
//                       sliver: SliverSafeArea(
//                         top: false,
//                         bottom: false,
//                         sliver: SliverAppBar(
//                             toolbarHeight: toolBarHeight,
//                             centerTitle: false,
//                             elevation: 1,
//                             shadowColor: Colors.grey,
//                             backgroundColor: Colors.white,
//                             titleSpacing: 2,
//                             automaticallyImplyLeading: false,
//                             systemOverlayStyle: SystemUiOverlayStyle(
//                               statusBarBrightness: Brightness.light,
//                               statusBarColor: statusBar,
//                               systemNavigationBarColor: Colors.white,
//                               systemNavigationBarIconBrightness: Brightness.dark,
//                               statusBarIconBrightness: Brightness.dark,
//                             ),
//                             flexibleSpace: isAndroid ? null : _toolBar(),
//                             title: isAndroid ? _toolBar() : null,
//                             floating: enableTabBar
//                                 ? true
//                                 : toolBar.pinned == true
//                                     ? false
//                                     : true,
//                             pinned: enableTabBar
//                                 ? true
//                                 : toolBar.pinned == true
//                                     ? true
//                                     : false,
//                             snap: enableTabBar
//                                 ? true
//                                 : toolBar.pinned == true
//                                     ? false
//                                     : true,
//                             primary: true,
//                             forceElevated: innerBoxIsScrolled,
//                             bottom: null),
//                       ),
//                     ),
//                   ];
//                 },
//                 body: content,
//               ) //multipleLayoutStatus(child: content))
//             : content,
//       ),
//       floatingActionButtonLocation: enableBottomNavigator ? FloatingActionButtonLocation.centerDocked : null,
//       floatingActionButton:
//           enableBottomNavigator && (_bottomNavigator?.floating != null) ? _bottomNavigator!.floating : null,
//       bottomNavigationBar: enableBottomNavigator
//           ? BottomAppBar(
//               shape: const CircularNotchedRectangle(),
//               notchMargin: 5,
//               color: Colors.white,
//               child: _bottomNavigator?.bottomNavigator ?? Container())
//           : null,
//     );
//   }
//
//   Widget _toolBar() {
//     return Container(
//       color: statusBar,
//       alignment: Alignment.bottomCenter,
//       child: PreferredSize(
//         child: Container(
//           color: Colors.white,
//           width: MediaQuery.of(context).size.width,
//           height: kToolbarHeight,
//           child: Stack(
//             //mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 child: Text(
//                   toolBar.title ?? "title",
//                   style: textTheme.headline6?.copyWith(
//                     color: PrjColors.black,
//                     fontSize: 17,
//                   ),
//                 ),
//                 //color: Colors.red,
//                 alignment: Alignment.center,
//                 margin: EdgeInsets.only(
//                   left: 15 + leadingWidth + 8,
//                   right: 15 + leadingWidth + 8,
//                 ),
//               ),
//               leadingWidget() ?? Container(),
//               Container(
//                 margin: const EdgeInsets.only(right: 15),
//                 alignment: Alignment.centerRight,
//                 child: Visibility(
//                   visible: toolBar.actionWidget != null,
//                   child: SizedBox(
//                     height: leadingWidth,
//                     width: leadingWidth,
//                     child: InkWell(
//                       child: toolBar.actionWidget ??
//                           Image.asset(
//                             "packages/theme/assets/images/ic_filter.png",
//                           ),
//                       onTap: () {
//                         toolBar.onClickAction?.call();
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         preferredSize: const Size.fromHeight(kToolbarHeight + 150),
//       ),
//     );
//   }
//
//   // Widget multipleLayoutStatus<B extends BaseEntity>(
//   //     {required Widget Function(CcResponse<B>? response) builder}) {
//   //   return ValueListenableBuilder(
//   //     valueListenable: _multiLayoutStatus,
//   //     builder:
//   //         (BuildContext context, LayoutStatus value, Widget? _child) {
//   //       CcResponse<B>? result;
//   //       if (response != null) {
//   //         result = response as Response<B>;
//   //       }
//   //       return Stack(
//   //         children: [
//   //           Visibility(
//   //             child: builder(result),
//   //             visible: value == LayoutStatus.content,
//   //           ),
//   //           Visibility(
//   //             child: const SpinKitScreen(),
//   //             visible: value == LayoutStatus.loading,
//   //           ),
//   //           Visibility(
//   //             child: const ErrorScreen(),
//   //             visible: value == LayoutStatus.error,
//   //           ),
//   //           Visibility(
//   //             child: const ErrorNetworkingScreen(),
//   //             visible: value == LayoutStatus.networkError,
//   //           ),
//   //           Visibility(
//   //             child: const EmptyScreen(),
//   //             visible: value == LayoutStatus.empty,
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }
//
//   @override
//   void didUpdateWidget(covariant T oldWidget) {
//     _getLogger("didUpdateWidget:...");
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   void deactivate() {
//     _getLogger("deactivate:...");
//     super.deactivate();
//   }
//
//   @override
//   void dispose() {
//     _getLogger("dispose:...");
//     _multiLayoutStatus.dispose();
//     super.dispose();
//   }
// }
//
// class CustomToolBar {
//   Widget? leadWidget;
//   Widget? actionWidget;
//   Function? onClickAction;
//   String? title;
//   bool? hideStatusBar;
//   bool? pinned = true;
//   List<String>? tabs;
// }
//
// class CustomBottomNavigator {
//   FloatingActionButton? floating;
//   Widget? bottomNavigator;
// }
