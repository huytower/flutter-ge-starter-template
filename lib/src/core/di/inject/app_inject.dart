import 'package:app_config/di/inject/app_config_inject.dart';
import 'package:data/config/di/inject/data_inject.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'app_inject.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt'
)
Future appInject() async {
  await appConfigInject(getIt);
  await dataInject(getIt);

  getIt.$initGetIt();
}
