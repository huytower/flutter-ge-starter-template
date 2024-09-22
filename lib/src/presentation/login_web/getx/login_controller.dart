import 'package:cc_library/constant/cc_log_tags.dart';
import 'package:app_config/config/app_config/cc_app_config.dart';
import 'package:app_config/config/app_storage/cc_app_storage.dart';
import 'package:app_config/enum/layout_status.dart';
import 'package:data/config/di/inject/data_inject.dart';
import 'package:data/helper/session_helper.dart';
import 'package:data/model/global/user_principal.dart';
import 'package:get/get.dart';

import '../../base/structure/getx/cc_get_controller/cc_get_controller.dart';
import '../../base/structure/getx/cc_get_view/cc_get_view.dart';
import '../../home/get_x/home_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

// @injectable
class LoginController extends CcGetController {
  final String url = "${CcAppHostUrlName.baseUrlOther}Accounts/LoginMobile";

  @override
  void onInit() {
    super.onInit();

    layoutStatus.value = LayoutStatus.success;

    try {
      0.8.delay(() {
        /// Logic : MUST disconnect existed vpn connection if logout success
        if (Get.isRegistered<Function>(tag: HomeController.TAG_VPN_DISCONNECT)) {
          Get.find<Function>(tag: HomeController.TAG_VPN_DISCONNECT).call();
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future onLoginCallback(agr) async {
    try {
      var json = agr[0];
      UserPrincipal user = UserPrincipal.fromJson(json);

      /// is different user?
      /// - true : force back to Home page, ex. : Get.offNamedUntil
      /// - false : do nothing
      var userOld = CcAppStorage.instance.user;
      bool isChangeUser = false;

      if (userOld?.userID != null) {
        isChangeUser = userOld!.userID != user.userID;
      }

      await setUser(user);
      await onLoginSuccess(isChangeUser);
    } catch (objEx) {
      // RoutingHelper.instance.redirect(Get.context!, '/logout');
    }

    getItData<SessionHelper>().disableModeLogin();
  }

  Future<void> onLoginSuccess(bool isChangeUser) async {
    'onLoginSuccess() :'.Log();

    if (Get.isRegistered<Function>(tag: HomeController.TAG_INIT_VPN_CONFIG)) {
      await Get.find<Function>(tag: HomeController.TAG_INIT_VPN_CONFIG).call();
    }

    Get.back(result: true);
  }
}

UserPrincipal get user {
  if (CcAppStorage.instance.user == null) {
    return UserPrincipal();
  }
  return CcAppStorage.instance.user!;
}

Future<void> setUser(UserPrincipal u) async {
  'Is user logged-in? = ${u.toJson()}'.Log(CcLogTags.APP);

  // await UserService.setCurrentUser(u);
  // await UserService.currentUser();

  VpnDataObject.vpnPassword.value = u.vpnPassword ?? '';
  VpnDataObject.vpnUrl.value = u.vpnUrl ?? '';
  VpnDataObject.vpnUsername.value = u.vpnUsername ?? '';

  CcAppStorage.instance.user = u;
}

class VpnDataObject {
  static RxString get vpnPassword => (user.vpnPassword ?? '').obs;

  static RxString get vpnUsername => (user.vpnUsername ?? '').obs;

  static RxString get vpnUrl => (user.vpnUrl ?? '').obs;
}
