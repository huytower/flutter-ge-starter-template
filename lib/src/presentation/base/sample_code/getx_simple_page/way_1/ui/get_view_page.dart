import 'package:auto_route/annotations.dart';
import 'package:cc_library/widget/button/cc_close_btn.dart';
import 'package:cc_library/widget/button/cc_debounce_widget.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/mixin/cc_load_more_mixin.dart';
import '../../../../../../core/mixin/cc_pull_to_refresh_mixin.dart';
import '../../../../structure/getx/cc_get_view/cc_get_view.dart';
import '../../../watch_it_simple_page/way_1/ui/component_view_watch_it.dart';
import '../getx/get_view_controller.dart';
import '../mixin/get_view_provider.dart';

/// GETX : UI
/// Step 2 : create UI screen||page
/// - Obx : notify data set changed, depends on .obs value
///
/// or
/// convert from old UI page structure to `getX structure` (ex. ProfilePage, ...)
///   Put UI widgets in `content()` method,
///   ex. :
///         @override
///         Widget? content(BuildContext context) {
///           return Column(
///             children: [
///               item(),
///               item(),
///             ],
///           );
///         }
/// NOTICE that There are 2 types for using :
/// - Popular type :
///   ex. `class ProfileScreen extends CcGetView<ProfileController>`
/// - Customize type : when need customize [base|default widgets], by adding `mixin`
///   ex. `class ProfileScreen extends CcGetView<ProfileController> with HomeProvider`
@RoutePage()
class GetViewPage extends CcGetView<GetViewController> with GetViewProvider, CcPullRefreshMixin, CcLoadMoreMixin {
  GetViewPage({Key? key})
      : super(
          key: key,
        );

  //----------------------------------------------------------------------------
  @override
  Widget? content() {
    return Stack(
      children: [
        /// Sample code : WatchIt : notify data set changed a component - a part of total page
        ComponentViewWatchIt(),

        /// Sample code : GetX : notify data set changed
        Obx(() {
          return buildList();
        }),
      ],
    );
  }

  //----------------------------------------------------------------------------

  Widget buildComponent() {
    return Container(
      height: 100,
      width: Get.width,
      color: Colors.blueGrey,
      child: CcDebounce(
        onTap: () {
          'DebounceWidget'.Log();

          controller.fetchNewsApi();
        },
        child: CcCloseBtn(
          onTap: () {
            'close() :'.Log();

            controller.fetchNewsApi();
          },
          icon: const Icon(
            Icons.access_alarm,
            color: Colors.red,
            size: 60,
          ),
          width: 120,
          height: 80,
          bgColor: Colors.blue,
        ),
      ),
    );
  }

  GestureDetector buildItem(int index) {
    return GestureDetector(
      onTap: () => controller.fetchNewsDetailApi(controller.sampleCodeFakeList[index].id.toString()),
      child: Container(
        height: 150,
        alignment: Alignment.center,
        child: CcText(
          'at $index : ${controller.sampleCodeFakeList[index].name}',
          color: Colors.blueGrey,
          fontSize: 24,
          marginLeft: 50,
        ),
      ),
    );
  }

  Widget buildList() => controller.sampleCodeFakeList.isNotEmpty ? buildListComponent() : buildListEmpty();

  /// Sample code : Attach mixin : pull to refresh, load more ...
  /// Sample code : or use default `RefreshIndicator` widget ...
  ///
  /// ex.
  ///
  /// return RefreshIndicator(
  ///     onRefresh: controller.onRefresh,
  ///     child: buildLoadMore(
  ///       onLoadMore: controller.onLoadMore,
  ///       child: buildListData(),
  ///     ));
  ///
  Widget buildListComponent() {
    return buildPullToRefresh(
        onRefresh: controller.onRefresh,
        child: buildLoadMore(
          onLoadMore: controller.onLoadMore,
          child: buildListData(),
        ));
  }

  ListView buildListData() {
    return ListView.builder(
        itemCount: controller.sampleCodeFakeList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildItem(index);
        });
  }

  Column buildListEmpty() {
    return Column(
      children: [
        const CcSpaceSmall(),
        buildComponent(),
        const CcSpaceSmall(),
        buildComponent(),
      ],
    );
  }
}
