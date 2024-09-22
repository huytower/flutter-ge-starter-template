// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_config/config/app_storage/cc_app_storage.dart' as _i3;
import 'package:app_config/config/app_track_log/cc_app_track_log.dart' as _i4;
import 'package:app_config/config/device_info/cc_device_info.dart' as _i5;
import 'package:app_config/di/module/app_config_module.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt $initAppConfigGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appConfigModule = _$AppConfigModule();
    gh.lazySingleton<_i3.CcAppStorage>(() => appConfigModule.ccAppStorage);
    gh.lazySingleton<_i4.CcAppTrackLog>(() => appConfigModule.ccAppTrackLog);
    gh.lazySingleton<_i5.CcDeviceInfo>(() => appConfigModule.ccDeviceInfo);
    return this;
  }
}

class _$AppConfigModule extends _i6.AppConfigModule {}
