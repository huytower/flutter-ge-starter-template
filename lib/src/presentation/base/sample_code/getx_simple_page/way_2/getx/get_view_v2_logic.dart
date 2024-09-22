import 'package:app_config/enum/layout_status.dart';

import '../../../../structure/getx/cc_get_controller/cc_get_controller.dart';
import 'get_view_v2_state.dart';

class GetViewV2Logic extends CcGetController {
  final GetViewV2State pageState = GetViewV2State();

  @override
  void onInit() {
    super.onInit();

    layoutStatus.value = LayoutStatus.success;
  }

  @override
  void onReady() {
    super.onReady();

    layoutStatus.value = LayoutStatus.success;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increase() => pageState.counter.value++;
}
