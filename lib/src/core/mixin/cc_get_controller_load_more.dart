// import 'package:app_config/enum/layout_status.dart';
// import 'package:get/get.dart';
//
// abstract class CcLoadMoreControllerProvider {
//   final Rx<LayoutStatus> layoutLoading = Rx<LayoutStatus>(LayoutStatus.success);
//
//   Future<void> onLoadMore() async {
//     if (layoutLoading.value == LayoutStatus.load_more) {
//       return;
//     }
//     layoutLoading.value = LayoutStatus.load_more;
//     await loadData();
//     layoutLoading.value = LayoutStatus.success;
//   }
//
//   ///override from local
//   Future<void> loadData() async {
//     await 2.0.delay();
//   }
// }
