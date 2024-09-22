import 'package:auto_route/annotations.dart';
import 'package:cc_library/widget/button/cc_close_btn.dart';
import 'package:cc_library/widget/button/cc_debounce_widget.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../structure/getx/cc_get_view/cc_get_view.dart';
import '../getx/get_view_v2_logic.dart';
import '../mixin/get_view_v2_provider.dart';

@RoutePage()
class GetViewV2Page extends CcGetView<GetViewV2Logic> with GetViewV2Provider {
  final logic = Get.find<GetViewV2Logic>();
  final state = Get.find<GetViewV2Logic>().state;

  GetViewV2Page({super.key});

  @override
  Widget? content() => buildContainer();

  Widget buildContainer() => Column(
        children: [
          Center(
            child: Obx(() {
              return CcText(
                state.toString(),
                color: Colors.red,
                fontSize: 32,
              );
            }),
          ),
          Obx(() {
            return Center(
              child: CcText(
                logic.pageState.counter.value.toString(),
                color: Colors.red,
                fontSize: 32,
              ),
            );
          }),
          const CcSpaceSmall(),
          item(),
          const CcSpaceSmall(),
          item(),
        ],
      );

  Widget item() {
    return Container(
      height: 100,
      width: Get.width,
      color: Colors.blueGrey,
      child: CcDebounce(
        onTap: () {
          'DebounceWidget'.Log();
        },
        child: CcCloseBtn(
          onTap: () {
            'CloseButtonWidget() :'.Log();

            logic.increase();
          },
          icon: const Icon(
            Icons.access_alarm,
            color: Colors.blueGrey,
            size: 50,
          ),
          width: 70,
          height: 70,
          bgColor: Colors.blue,
        ),
      ),
    );
  }
}
