import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'app_config_inject.config.dart';

GetIt getItAppConfig = GetIt.instance;

@InjectableInit(
  initializerName: r'$initAppConfigGetIt'
)
Future appConfigInject(GetIt getIt) async {
  getItAppConfig = getIt;

  getIt.$initAppConfigGetIt();
}
