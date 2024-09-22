// import 'package:libphonenumber/libphonenumber.dart';
// import 'package:rxdart/rxdart.dart';
//
// class PhoneNumberUtils {
//   final stream = BehaviorSubject<RegionInfo?>();
//   void getRegion(String phone, String iso) async {
//     try {
//       RegionInfo region = await PhoneNumberUtil.getRegionInfo(phoneNumber: phone, isoCode: iso);
//       stream.sink.add(region);
//     } on Exception {
//       stream.sink.add(null);
//     }
//   }
//   onDispose() {
//     stream.onCancel?.call();
//   }
// }
