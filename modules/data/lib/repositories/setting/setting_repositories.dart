import 'package:data/datasource/remote/setting/setting_remote.dart';
// import 'package:injectable/injectable.dart';

abstract class SettingRepositories {
  List<String> getString();
}

// @Singleton(as: SettingRepositories)
class SettingRepositoriesImpl implements SettingRepositories {
  SettingRepositoriesImpl(this.settingApi);

  late SettingApi settingApi;

  @override
  List<String> getString() => settingApi.getList();
}
