
import 'package:get/get.dart';

import 'get_view_v2_logic.dart';

class GetViewV2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetViewV2Logic());
  }
}
