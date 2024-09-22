// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/config/di/module/data_module.dart' as _i7;
import 'package:data/datasource/remote/sample_code_fake_api/sample_code_fake_api_remote.dart'
    as _i5;
import 'package:data/helper/session_helper.dart' as _i3;
import 'package:data/repositories/sample_code_fake_api/sample_code_fake_api_repositories.dart'
    as _i6;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt $initModuleGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dataModule = _$DataModule();
    gh.singleton<_i3.SessionHelper>(() => _i3.SessionHelper());
    gh.factory<String>(
      () => dataModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.factory<String>(
      () => dataModule.baseUrlOther,
      instanceName: 'baseUrlOther',
    );
    gh.singleton<_i4.Dio>(
        () => dataModule.dio(gh<String>(instanceName: 'baseUrl')));
    gh.lazySingleton<_i5.SampleCodeFakeApiRemote>(
        () => _i5.SampleCodeFakeApiRemote(
              gh<_i4.Dio>(),
              baseUrl: gh<String>(instanceName: 'baseUrl'),
            ));
    gh.lazySingleton<_i6.SampleCodeFakeApiRepositories>(
        () => _i6.SampleCodeFakeApiImpl(
              dio: gh<_i4.Dio>(),
              remote: gh<_i5.SampleCodeFakeApiRemote>(),
            ));
    return this;
  }
}

class _$DataModule extends _i7.DataModule {}
