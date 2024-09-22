// import 'package:injectable/injectable.dart';

abstract class SettingApi {
  List<String> getList();
}

// @Singleton(as: SettingApi)
class SettingApiImpl extends SettingApi {
  @override
  List<String> getList() => ['setting_api', 'setting_api'];
}
