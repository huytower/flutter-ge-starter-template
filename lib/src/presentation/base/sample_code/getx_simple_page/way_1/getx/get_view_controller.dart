import 'dart:io';

import 'package:app_config/config/app_track_log/cc_app_track_log.dart';
import 'package:app_config/enum/layout_status.dart';
import 'package:app_config/extension/app_track_log_extension.dart';
import 'package:data/entities/sample_code_fake_api/res_sample_code_fake_model.dart';
import 'package:data/repositories/sample_code_fake_api/sample_code_fake_api_repositories.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:widget/export/cc_ktx_export.dart';

import '../../../../../../core/di/inject/app_inject.dart';
import '../../../../../../core/extension/app_tracking_log_extension.dart';
import '../../../../../../core/helper/network_helper.dart';
import '../../../../structure/getx/cc_get_controller/cc_get_controller.dart';

/// GETX : BINDINGS + CONTROLLER
/// Step 1 : create Binding + Controller
/// - .obs vars. : declare in the controller
///
/// or
/// convert from old bloc structure to `getX structure`(ex. ProfilePageBloc, ...)
/// created these sample classes :
///   a. `class ProfileBinding extends Bindings` (target: put multiple controller in here)
///   b. `class ProfileController extends CcGetController` :
///     (target: put all logics in here, include UI logic .v.v)
///     ex . `isLoading ? showLoading() : hideLoading` => `controller.onLoading()`
class GetViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => getIt<GetViewController>());
  }
}

@lazySingleton
class GetViewController extends CcGetController {
  SampleCodeFakeApiImpl repository;

  @factoryMethod
  GetViewController({required this.repository});

  final RxList<ResSampleCodeFakeModel> sampleCodeFakeList = <ResSampleCodeFakeModel>[].obs; // data observable

  // SampleCodeFakeApiImpl repositories = getItData<SampleCodeFakeApiImpl>();

  @override
  void onInit() {
    super.onInit();

    layoutStatus.value = LayoutStatus.success;
  }

  @override
  void onReady() {
    super.onReady();

    // fetchNewsApi();
  }

  var l = <ResSampleCodeFakeModel>[];

  Future fetchNewsApi() async {
    final hasInternet = await getIt<NetworkHelper>().hasInternet;

    "fetchNews() :.. "
            "\n hasInternet = ${hasInternet}"
        .Log();

    try {
      1.delay(() {
        try {
          throw SocketException('Connect time out');
        } catch (e) {
          'e = $e'.Log();

          CcAppTrackLog.instance.initMsgIfNull()?.add(e.toString());
        }
      });
      5.delay(() {
        'msg = ${CcAppTrackLog.instance.initMsgIfNull()}'.Log();

        // TODO(huy): check msg in hive, can not init
        CcAppTrackLog.instance.initMsgIfNull()?.forEach((element) {
          'element = ${element}'.Log();
        });
      });

      throw const CertificateException('Expired cert.');

      final res = await repository.getList();

      l = res.listElements!;

      res.listElements!.forEach((element) {
        sampleCodeFakeList.add(element);
      });

      layoutStatus.value = LayoutStatus.success;
    } catch (e) {
      'catch: e = $e'.Log();

      /// Internal App Tracking Page flow :
      /// 1 - summon hive box - name 'error'
      /// 2 - append error log by using `add()` method
      /// 3 - show error log on UI by reading box
      /// 4 - allow copy that log
      /// 5 - able limit show last 100 code lines?

      e.addAppTrackingLog();
      // getIt<CcAppTrackLog>().initMsgIfNull()?.add(e.toString());
    }
  }

  Future fetchNewsDetailApi(String id) async {
    try {
      final res = await repository.getObj(id);

      'res = $res'.Log();

      layoutStatus.value = LayoutStatus.success;
    } catch (e) {
      'e = $e'.Log();
    }
  }

  Future<bool> onLoadMore() async {
    await Future.delayed(const Duration(seconds: 2));

    l.forEach((element) {
      sampleCodeFakeList.add(element);
    });

    return true;
  }

  Future onRefresh() async {
    await Future.delayed(const Duration(
      seconds: 1,
    ));

    sampleCodeFakeList.clear();

    fetchNewsApi();
  }
}