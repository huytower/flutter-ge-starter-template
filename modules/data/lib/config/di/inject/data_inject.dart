import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'data_inject.config.dart';

GetIt getItData = GetIt.instance;

@InjectableInit(
  initializerName: r'$initModuleGetIt'
)
Future dataInject(GetIt getIt) async {
  getItData = getIt;

  getIt.$initModuleGetIt();
}

// @singleton
// class TestService {
//   String value = "test_service";
// }
