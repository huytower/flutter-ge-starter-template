import 'package:cc_library/export/export_common_ui.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../../../../../../core/di/inject/app_inject.dart';
import '../logic/component_watch_it_v2_logic.dart';

/// WatchItMixin : UI
/// create UI screen||page
/// - watchIt<T>() : notify that expect to read modified data reactively
///
///   ex. :
///         @override
///         Widget? content(BuildContext context) {
///           watchIt<SampleModel>();
///
///           return Text(controller.sampleModelNotifier.model.id.toString(),);
///         }
///
class ComponentViewWatchItV2 extends WatchingWidget {
  const ComponentViewWatchItV2({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = getIt<ComponentWatchItV2Logic>();

    if (!logic.isReady.value) {
      /// WatchItMixin : Step 2 : Define where to trigger|notify data set changed
      logic.registerListener(); // register one-time
    }

    return logic.isReady.value == true
        ? Stack(
            children: [
              CcPositionCenter(
                child: CcText(
                  /// WatchItMixin : Step 4 : see modified value in here
                  logic.sampleModel.model.id.toString(),
                  color: Colors.red,
                  fontSize: 32,
                  textAlign: TextAlign.center,
                  align: Alignment.center,
                ),
              ),
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}
