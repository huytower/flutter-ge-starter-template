import 'dart:ffi';

import 'package:get/get.dart';

class GetViewV2State {
  GetViewV2State() {
    ///Initialize variables
    counter.value = 0;
  }

  final RxInt counter = 100.obs;
}
