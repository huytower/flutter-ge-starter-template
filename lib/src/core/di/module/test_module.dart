// @module
// abstract class TestModule {
//   @preResolve
//   @LazySingleton()
//   Future<Box> get openBox async {
//     final appDocumentDir = await getApplicationDocumentsDirectory();
//     Hive.init(appDocumentDir.path);
//     return Hive.openBox<String>(CcHiveBox.cc_key);
//   }
// }
