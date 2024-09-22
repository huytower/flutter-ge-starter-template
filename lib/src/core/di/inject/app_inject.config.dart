// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/repositories/sample_code_fake_api/sample_code_fake_api_repositories.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i9;
import 'package:mobile_flutter_template/src/core/di/module/app_module.dart'
    as _i12;
import 'package:mobile_flutter_template/src/core/helper/network_helper.dart'
    as _i10;
import 'package:mobile_flutter_template/src/presentation/app_track_log/logic/app_track_log_logic.dart'
    as _i4;
import 'package:mobile_flutter_template/src/presentation/base/sample_code/bloc_simple_page/cubit/simple/simple_cubit.dart'
    as _i11;
import 'package:mobile_flutter_template/src/presentation/base/sample_code/bloc_simple_page/origin/advance/advance_bloc.dart'
    as _i3;
import 'package:mobile_flutter_template/src/presentation/base/sample_code/getx_simple_page/way_1/getx/get_view_controller.dart'
    as _i7;
import 'package:mobile_flutter_template/src/presentation/base/sample_code/watch_it_simple_page/way_1/logic/component_watch_it_logic.dart'
    as _i5;
import 'package:mobile_flutter_template/src/presentation/base/sample_code/watch_it_simple_page/way_2/logic/component_watch_it_v2_logic.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt $initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.AdvanceBloc>(() => _i3.AdvanceBloc());
    gh.lazySingleton<_i4.AppTrackLogLogic>(() => _i4.AppTrackLogLogic());
    gh.lazySingleton<_i5.ComponentWatchItLogic>(
        () => _i5.ComponentWatchItLogic());
    gh.lazySingleton<_i6.ComponentWatchItV2Logic>(
        () => _i6.ComponentWatchItV2Logic());
    gh.lazySingleton<_i7.GetViewController>(() =>
        _i7.GetViewController(repository: gh<_i8.SampleCodeFakeApiImpl>()));
    gh.singleton<_i9.InternetConnectionChecker>(
        () => appModule.connectionChecker);
    gh.singleton<_i10.NetworkHelper>(
        () => _i10.NetworkHelper(gh<_i9.InternetConnectionChecker>()));
    gh.lazySingleton<_i11.SimpleCubit>(() => _i11.SimpleCubit());
    return this;
  }
}

class _$AppModule extends _i12.AppModule {}
