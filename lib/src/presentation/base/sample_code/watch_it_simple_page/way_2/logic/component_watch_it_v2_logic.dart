import 'package:data/model/sample/sample_model_watch_it_v2.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:watch_it/watch_it.dart';
import 'package:widget/export/cc_ktx_export.dart';

import '../../../../../../core/di/inject/app_inject.dart';

/// WatchItMixin : LOGIC
/// Step 1 : create Logic component, mandatory includes :
/// - boolean value notifier. : to avoid build() called twice issues
/// - registerFutureHandler() : register listener to listen data set changed
///
@lazySingleton
class ComponentWatchItV2Logic {
  final isReady = ValueNotifier(false);

  final sampleModel = getIt<SampleModelWatchItV2Notifier>();

  Future<bool?> fetchNewsApi(SampleModelWatchItV2Notifier p0) async {
    // "fetchNews() :.. ".Log();

    try {
      /// WatchItMixin : Step 3 : assign new data, then trigger|notify data set changed
      p0.model = SampleModelOriWatchItV2(id: '4565', isValid: true);
    } catch (e) {
      'e = $e'.Log();
    }

    return p0.model.isValid;
  }

  void registerListener() {
    /// register listener
    registerFutureHandler(
        select: (SampleModelWatchItV2Notifier p0) => fetchNewsApi(p0),
        handler: (c, snapshot, cancel) {
          isReady.value = snapshot.data!;

          /// Dispose
          if (isReady.value) {
            cancel();
          }
        });
  }
}
