import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

/// WatchItMixin : Step 1 : Define observable model obj.
class SampleModelWatchItNotifier extends ChangeNotifier {
  SampleModelOri _model = SampleModelOri();

  SampleModelOri get model => _model;

  set model(SampleModelOri v) {
    _model = v;
    notifyListeners();
  }
}

class SampleModelOri {
  SampleModelOri({this.deviceInfo = ''});

  final String? deviceInfo;
}