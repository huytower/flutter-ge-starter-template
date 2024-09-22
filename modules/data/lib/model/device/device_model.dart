import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

class DeviceModelNotifier extends ChangeNotifier {

  DeviceModelOri _model = DeviceModelOri();

  DeviceModelOri get model => _model;

  set model(DeviceModelOri v) {
    _model = v;
    notifyListeners();
  }
}

class DeviceModelOri {

  DeviceModelOri({this.deviceInfo = ''});

  final String deviceInfo;
}