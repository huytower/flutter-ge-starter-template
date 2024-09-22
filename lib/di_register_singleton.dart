import 'package:data/model/device/device_model.dart';
import 'package:data/model/sample/sample_model_watch_it.dart';
import 'package:data/model/sample/sample_model_watch_it_v2.dart';

import 'src/core/di/inject/app_inject.dart';
import 'src/presentation/app_track_log/logic/app_track_log_logic.dart';
import 'src/presentation/web/get_x/web_controller.dart';

void registerSingletonApp() {
  registerSingletonAppController();
  registerSingletonAppModel();
}

/// Model
void registerSingletonAppModel() {
  getIt.registerLazySingleton(() => SampleModelWatchItV2Notifier());
  getIt.registerLazySingleton(() => SampleModelWatchItNotifier());
  getIt.registerLazySingleton(() => DeviceModelNotifier());
}

/// Controller
void registerSingletonAppController() {
  getIt.registerLazySingleton(() => WebController());
}
