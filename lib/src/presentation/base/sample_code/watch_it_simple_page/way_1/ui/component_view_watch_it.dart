import 'package:cc_library/export/export_common_ui.dart';
import 'package:cc_library/widget/flex/cc_column_center.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:cc_library/widget/text/app_name_widget.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../../../../../../core/di/inject/app_inject.dart';
import '../logic/component_watch_it_logic.dart';

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
class ComponentViewWatchIt extends WatchingWidget {
  ComponentViewWatchIt({super.key});

  final logic = getIt<ComponentWatchItLogic>();

  @override
  Widget build(BuildContext context) {
    if (!logic.isReady.value) {
      logic.isReady.value = true;

      /// WatchItMixin : Step 2 : Define where to trigger|notify data set changed
      logic.getDeviceInfo(); // register one-time
    }

    return logic.isReady.value == true
        ? buildBody()
        : const Center(child: CircularProgressIndicator());
  }

  Widget buildBody() => CcColCenter(children: [
        /// section : app name, build config
        /// section : app version, code
        AppNameWidget(logic.appInfo, fontSize: 14,),
        const CcSpaceSmall(),

        /// section : app tracking log
        /// section : device info
        const CcSpaceSmall(),
        buildDeviceInfo(),
      ]);

  Widget buildDeviceInfo() => (logic.modelNotifier.model.deviceInfo ?? '').isNotEmpty
      ? Stack(
          children: [
            CcPositionCenter(
              child: CcText(
                /// WatchItMixin : Step 4 : see modified value in here
                logic.modelNotifier.model.deviceInfo,
                color: Colors.grey,
                fontSize: 12,
                textAlign: TextAlign.center,
                align: Alignment.center,
              ),
            ),
          ],
        )
      : const Center(child: CircularProgressIndicator());
}
