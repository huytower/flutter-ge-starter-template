import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

/// WatchItMixin : Step 1 : Define observable model obj.
class SampleModelWatchItV2Notifier extends ChangeNotifier {
  SampleModelOriWatchItV2 _model = SampleModelOriWatchItV2();

  SampleModelOriWatchItV2 get model => _model;

  set model(SampleModelOriWatchItV2 value) {
    _model = value;
    notifyListeners();
  }
}

class SampleModelOriWatchItV2 {
  String? id = '';
  bool? isValid = false;

  SampleModelOriWatchItV2({this.id, this.isValid});
}
