import 'package:app_config/config/device_info/cc_device_info.dart';
import 'package:cc_library/widget/divider_line/cc_divider.dart';
import 'package:cc_library/widget/flex/cc_column_start.dart';
import 'package:cc_library/widget/icon/ic_copy.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:cc_library/widget/text/app_name_widget.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:data/model/device/device_model.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import 'package:widget/export/cc_ktx_export.dart';

import '../../../core/di/inject/app_inject.dart';
import '../logic/app_track_log_logic.dart';

/// SHOW APP TRACKING LOG PAGE
///
/// ex.
/// OpenDialog.showBottomSheet(context, AppTrackLogPage(),);
///
/// CLASS STRUCTURE
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
@immutable
class AppTrackLogPage extends WatchingWidget {
  AppTrackLogPage({super.key});

  final logic = getIt<AppTrackLogLogic>();

  @override
  Widget build(BuildContext context) {
    /// bool indicate that build method run one time
    if (!logic.isReady.value) {
      logic.isReady.value = true;

      logic.getDeviceInfo();
    }

    String deviceInfo = watchIt<DeviceModelNotifier>().model.deviceInfo;

    return buildBody(deviceInfo);
  }

  Widget buildBody(String deviceInfo) => Column(mainAxisSize: MainAxisSize.min, children: [
        /// section : app name, build config
        /// section : app version, code
        const CcSpaceSmall(),
        CcCopyWidget(
          title: logic.appInfo,
          child: AppNameWidget(
            logic.appInfo,
            fontSize: 12,
          ),
        ),
        const CcSpaceSmall(),

        const CcDividerLine(
          color: Colors.grey,
        ),
        const CcSpaceSmall(),

        /// section : recently tracking logs, request logs ...
        Flexible(fit: FlexFit.loose, child: buildLogs()),

        const CcSpaceSmall(),
        const CcDividerLine(
          color: Colors.grey,
        ),

        /// section : app tracking log
        /// section : device info
        const CcSpaceSmall(),
        buildDeviceInfo(),
        const CcSpaceFooter(),
      ]);

  Widget buildDeviceInfo() => logic.modelNotifier.model.deviceInfo.isNotEmpty
      ? CcCopyWidget(
          title: logic.modelNotifier.model.deviceInfo,
          child: CcText(
            /// WatchItMixin : Step 4 : see modified value in here
            logic.modelNotifier.model.deviceInfo,
            color: Colors.grey,
            fontSize: 12,
            textAlign: TextAlign.center,
            align: Alignment.center,
            maxLines: 10,
          ))
      : const Center(child: CircularProgressIndicator());

  Widget buildLogs() {
    'buildLog() : loggingMessages = ${logic.loggingMessages?.length}'.Log();

    // logic.loggingMessages?.forEach((element) {
    //   'buildLog() : element = $element'.Log();
    // });

    return logic.loggingMessages!.isNotEmpty
        ? SizedBox(
            width: double.infinity,
            height: getIt<CcDeviceInfo>().deviceHeight! - 250,
            child: ListView.builder(
                itemCount: logic.loggingMessages?.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildLogItem(index);
                }),
          )
        : const CcText(
            'There is no app tracking logs now',
            color: Colors.grey,
            fontSize: 12,
            textAlign: TextAlign.center,
            align: Alignment.center,
          );
  }

  Widget buildLogItem(int index) {
    return CcColStart(
      children: [
        CcText(
          // '${logic.loggingMessages?[index]}${logic.loggingMessages?[index]}${logic.loggingMessages?[index]}${logic.loggingMessages?[index]}${logic.loggingMessages?[index]}${logic.loggingMessages?[index]}${logic.loggingMessages?[index]}${logic.loggingMessages?[index]}${logic.loggingMessages?[index]}',
          '${logic.loggingMessages?[index]}',
          color: (index.isEven) ? Colors.blueGrey: Colors.grey,
          fontSize: 12,
          marginLeft: 10,
          marginRight: 10,
          maxLines: 5,
          heightLine: 1.6,
        ),

        const CcSpaceSmallest(),
      ]
    );
  }
}
