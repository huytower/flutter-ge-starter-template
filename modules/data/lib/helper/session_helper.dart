import 'package:app_config/enum/layout_status.dart';
import 'package:injectable/injectable.dart';

@singleton
class SessionHelper {
  Events event = Events.none;
  Function(Events event)? onChangeEvent;

  /// Logic : is force to login page? ex. [token expired]
  /// - true : does not show dialog confirm, then force to login page
  /// - false : show dialog confirm only
  bool get isForceLogin => event == Events.processing || event == Events.openLoginPage;

  void enableModeLogin() => event = Events.processing;

  void disableModeLogin() => event = Events.none;

  void setEvent(Events _event) {
    if (_event != event) {
      event = _event;
      onChangeEvent?.call(_event);
    }
  }
}
