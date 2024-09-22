import 'dart:async';
import 'dart:io';

import 'package:app_config/config/setting_device/setting_device.dart';
import 'package:app_config/enum/cc_vpn_status.dart';
import 'package:app_config/enum/layout_status.dart';
import 'package:data/repositories/home/home_repositories.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:widget/export/cc_ui_export.dart';

import '../../base/structure/getx/cc_get_controller/cc_get_controller.dart';
import '../../login_web/getx/login_controller.dart';
import '../ui/switch/animated_switch.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

// @injectable
class HomeController extends CcGetController {
  late final HomeRepositories? homeRepositories;

  // HomeController({required this.homeRepositories});

  /// const
  static const String TAG_INIT_VPN_CONFIG = 'init_vpn_config';
  static const String TAG_VPN_DISCONNECT = 'vpn_disconnect';

  static const String URL_DASHBOARD = 'https://..com/';

  /// Feature : Default VPN Profile for all users if can not get remote profile due to socket timeout
  static const String defaultVpnProfileUrl =
      'https://storage.googleapis.com/../static/mobile-external/default.ovpn';

  /// data
  final keySwitch = GlobalKey<AnimatedSwitchState>();

  // final CCOpenvpn openvpn = CCOpenvpn();
  final Rx<CcVpnBtnStatus> vpnBtnStatus = CcVpnBtnStatus.UNSELECT.obs;

  final Rx<Timer> timer = Timer(Duration.zero, () {}).obs;

  // final Rx<VPNStage> vpnStage = VPNStage.error.obs;
  // final Rx<VpnStatus> vpnStatus = VpnStatus.empty().obs;
  final RxBool isConnectVpnFailed = false.obs;

  final RxBool isVpnConfigValid = false.obs;

  // var isModeTest = CcAppStorage.instance.isModeDebug.obs;

  void cancelTimer() => timer.value.cancel();

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onInit() {
    super.onInit();

    cancelTimer(); // cancel timer if existed

    initData();
  }

  @override
  void onPaused() {}

  @override
  void onResumed() {
    requestUpdateExistedVersion();
  }

  Future initData() async {
    /// show loading
    layoutStatus.value = LayoutStatus.loading;

    try {
      await initUUID();

      /// Init device info
      await initDeviceInfo();

      // final u = await UserHelper.currentUser();
      //
      // if (u != null) {
      //   /// Init default user info
      //   CcAppStorage.instance.user = u;
      //
      //   'Is user already logged-in? user = ${user.toJson()}'.Log(LogTags.APP, true);
      // }

      /// Logic : update app version if has
      // if (await UpdateVersionService().isUpdateAppVersion('App')) {
      //   Get.toNamed(PageConfig.UPDATE_VERSION);
      //
      //   return;
      // }

      /// Logic : MUST require user log-in
      // final bool isLogin = await UserHelper.isLogin();
      //
      // if (!isLogin) {
      //   /// Logic : after login success, MUST get vpn profile
      //   await Get.put<Function>(() {
      //     initVpnProfile();
      //   }, tag: TAG_INIT_VPN_CONFIG);
      //
      //   await redirectToLoginPage();
      // } else {
      //   await initVpnProfile();
      // }

      /// hide loading
      layoutStatus.value = LayoutStatus.success;
    } catch (e) {
      /// hide loading
      layoutStatus.value = LayoutStatus.success;

      print(e);
    }
  }

  Future initVpnProfile() async {
    var vpnProfileUrl = await VpnDataObject.vpnUrl.value;

    if (vpnProfileUrl.isEmpty) {
      vpnProfileUrl = defaultVpnProfileUrl;
    }

    final userName = VpnDataObject.vpnUsername.value, pass = VpnDataObject.vpnPassword.value;

    /// update UI
    isVpnConfigValid.value = userName.isNotEmpty && pass.isNotEmpty;

    /// Show failed vpn connection page
    // var vpnProfile = await readData(vpnProfileUrl);

    /// Logic : init VPN connection
    // openvpn.initialize(
    //   vpnProfile,
    //   onVpnStageChanged: (stage, rawStage) async {
    //     // "stage :.. ${stage} __ ${rawStage}".Log();
    //
    //     vpnStage.value = stage;
    //
    //     if (stage == VPNStage.connected) {
    //       "stage is connected ? = ${stage == VPNStage.connected}".Log();
    //
    //       updateSwitchConnectOn();
    //       setWebViewUrl();
    //       // 0.7.delay(() async {
    //       //   /// Put into memory once connect is on
    //       //   if (!Get.isRegistered<WebViewRedirect>(tag: TAG_WEB_DASHBOARD)) {
    //       //    /// Logic : save web view in memory
    //       //     await Get.put<WebViewRedirect>(buildWebView(), tag: TAG_WEB_DASHBOARD);
    //       //
    //       //     /// Connect is on
    //       //     await Get.put<WebRedirectController>(WebRedirectController(), permanent: true);
    //       //
    //       //     return;
    //       //   }
    //       // });
    //     } else if (stage == VPNStage.disconnected) {
    //       "stage is disconnected ? = ${stage == VPNStage.disconnected}".Log();
    //
    //       updateSwitchConnectOff();
    //     } else if (stage == VPNStage.vpn_generate_config ||
    //         stage == VPNStage.get_config ||
    //         stage == VPNStage.connecting) {
    //       "stage is connecting ? = ${stage == VPNStage.connecting}".Log();
    //
    //       vpnBtnStatus.value = CcVpnBtnStatus.LOADING;
    //     } else if (stage == VPNStage.error) {
    //       "stage is error ? = ${stage == VPNStage.error}".Log();
    //
    //       if (isConnectVpnFailed.value) {
    //         return;
    //       }
    //
    //       /// Logic : guarantee error only happens once
    //       /// then, disconnect current VPN
    //       /// then, redirect to login page
    //       isConnectVpnFailed.value = true;
    //       vpnBtnStatus.value = CcVpnBtnStatus.UNSELECT;
    //       vpnStage.value = VPNStage.error;
    //
    //       await onTriggerSwitchOff();
    //
    //       /// show confirm exit dialog
    //       OpenDialog.showDialogMessage(
    //         onTapOK: () {
    //           cancelTimer();
    //
    //           Get.toNamed(PageConfig.LOGOUT);
    //         },
    //         isExistOK: true,
    //         isDrag: false,
    //         w: CcColCenter(
    //           children: [
    //             const CcSpaceLarge(),
    //             CcText(
    //               'There is something wrong \n when connecting VPN profile.'
    //               '\n Please try re-login!',
    //               align: Alignment.center,
    //               color: Colors.black_70,
    //               fontSize: 16,
    //               fontWeight: FontWeight.w500,
    //               textAlign: TextAlign.center,
    //               maxLines: 5,
    //             ),
    //           ],
    //         ),
    //       );
    //
    //       return;
    //     }
    //   },
    //   onVpnStatusChanged: (status) {
    //     vpnStatus.value = status ?? VpnStatus.empty();
    //   },
    // );

    /// Logic : MUST disconnect existed vpn connection if logout success
    Get.put<Function>(() {
      onTriggerSwitchOff();
    }, tag: TAG_VPN_DISCONNECT);
  }

  /// Init device info
  Future initDeviceInfo() async {
    try {
      SettingDevice.init(Get.context!);

      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

      if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        String verNumber = iosInfo.systemVersion!.split('.')[0];
        SettingDevice.iosVersion = double.parse(verNumber);
      }
    } catch (objEx) {
    }
  }

  // Save UUID into Shared Prefs.?
  Future initUUID() async {
    /// Get UUID - Unique ID
    var uuid = const Uuid();
  }

  // bool get isVpnConnected => vpnStage.value == VPNStage.connected;
  //
  // bool get isVpnDisconnect => vpnStage.value == VPNStage.disconnected;
  //
  // bool get isVpnError => vpnStage.value == VPNStage.error;

  bool get isVpnStatusSelected => vpnBtnStatusValue == CcVpnBtnStatus.SELECTED;

  void onChangeModeTest(bool _isModeTest) {
    // isModeTest.value = _isModeTest;
  }

  void onTapAccessWebInfo() {
    if (isVpnConfigValid.value && isVpnStatusSelected) {
      cancelTimer(); // cancel timer if existed

      /// TRICK code to load correct web-view after connect to VPN success
      // 0.4.delay(() => Get.toNamed(PageNameEnum.WEB.name));
    } else {
      Fluttertoast.showToast(msg: 'Please turn on VPN connecting status!');
    }
  }

  void onToggleSwitch(CcVpnBtnStatus status) {
    vpnBtnStatus.value = status;

    "onToggle :.. ${vpnBtnStatusValue}".Log();

    when(variable: vpnBtnStatusValue, conditions: {
      /// Logic : if turn off switch btn, disconnect vpn connection
      CcVpnBtnStatus.UNSELECT: () {
        onTriggerSwitchOff();
      },

      /// Logic : if turn on switch btn, is waiting for connect vpn
      CcVpnBtnStatus.AWAIT_CONNECT: () {
        onTriggerSwitchOn();
      },
    });
  }

  Future onTriggerSwitchOff() async {
    cancelTimer(); // cancel timer if existed

    try {
      // 'onTriggerSwitchOff() : '
      //         '\n vpnStage.value = ${vpnStage.value}'
      //         '\n isVpnDisconnect = $isVpnDisconnect'
      //         '\n isVpnConnected = $isVpnConnected'
      //     .Log(LogTags.APP);

      // if (vpnStage.value != VPNStage.disconnected) {
      //   await openvpn.disconnect();
      // }
    } catch (e) {
      print(e);
    }
  }

  Future onTriggerSwitchOn() async {
    try {
      cancelTimer(); // cancel timer if existed

      // bool isConnected = await openvpn.engine.isConnected();
      //
      // 'onTriggerSwitchOn() : '
      //         '\n engine.initialized = ${openvpn.engine.initialized}'
      //         '\n vpnStage.value = ${vpnStage.value}'
      //         '\n isConnected = $isConnected'
      //     .Log();
      //
      // if (VpnDataObject.vpnUsername.value.isEmpty || VpnDataObject.vpnPassword.value.isEmpty) {
      //   Fluttertoast.showToast(msg: "Profile is invalid!", toastLength: Toast.LENGTH_SHORT);
      //   return;
      // }
      //
      // /// Logic : if vpn profile was not init yet, MUST init first, then connect
      // if (!openvpn.engine.initialized) {
      //   await initVpnProfile();
      // }
      //
      // /// Feature : Connect to VPN
      // await openvpn.connect(VpnDataObject.vpnUsername.value, VpnDataObject.vpnPassword.value);
      //
      // isConnected = await openvpn.engine.isConnected();

      // if (isConnected) {
      //   /// TRICK CODE
      //   /// Refresh UI with latest state
      //   updateSwitchConnectOn();
      //
      //   setWebViewUrl();
      // } else {
      //   /// TRICK CODE
      //   ///
      //   /// Logic : if there are
      //   /// - valid vpn profile
      //   /// - switch btn is off
      //   /// - vpn connection is disconnected
      //   /// run timer to refresh latest status if delay happens
      //   if (isVpnConfigValid.value && !isConnected && vpnBtnStatusValue != CcVpnBtnStatus.SELECTED) {
      //     /// ALWAYS show loading state for connecting to VPN profile
      //     updateSwitchConnecting();
      //
      //     /// yellow
      //
      //     timer.value = Timer(Duration(seconds: 5), () async {
      //       isConnected = await openvpn.engine.isConnected();
      //
      //       'onTriggerSwitchOn() : timer() : '
      //               '\n vpnStage.value = ${vpnStage.value}'
      //               '\n isConnected = $isConnected'
      //               '\n isVpnConnected = ${isVpnConnected}'
      //           .Log();
      //
      //       /// Logic : if there are
      //       /// - valid vpn profile
      //       /// - switch btn is off
      //       /// - vpn connection is connected
      //       /// syncing VPN connection status
      //       if (isVpnConfigValid.value) {
      //         /// Force switch connect is on
      //         if (isConnected && vpnBtnStatusValue != CcVpnBtnStatus.SELECTED) {
      //           ///green
      //           updateSwitchConnectOn();
      //
      //           setWebViewUrl();
      //         }
      //
      //         /// Force switch connect is off
      //         if (!isConnected && vpnBtnStatusValue == CcVpnBtnStatus.LOADING) {
      //           /// yellow
      //           updateSwitchConnectOff();
      //
      //           ///gray
      //         }
      //       }
      //     });
      //
      //     timer.call();
      //   }
      // }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<bool> redirectToLoginPage() async {
    cancelTimer(); // cancel timer if existed

    return true;
    // return await Get.toNamed(PageNameEnum.LOGIN.name);
  }

  Future requestUpdateExistedVersion() async {
    /// Logic : MUST require user log-in
    // final bool isLogin = await UserHelper.isLogin();

    // if (isLogin) {
    //   /// Logic : update app version if has
    //   if (await UpdateVersionService().isUpdateAppVersion('App')) {
    //     Get.toNamed(PageConfig.UPDATE_VERSION);
    //
    //     return;
    //   }
    // }
  }

  // void setWebViewUrl() => webViewRedirect.value = WebViewRedirect(
  //       url: URL_DASHBOARD,
  //       isOffLoadingFromWeb: true,
  //     );

  void updateSwitchConnectOff() {
    vpnBtnStatus.value = CcVpnBtnStatus.UNSELECT;
    // vpnStage.value = VPNStage.disconnected;
  }

  void updateSwitchConnecting() {
    vpnBtnStatus.value = CcVpnBtnStatus.LOADING;
    // vpnStage.value = VPNStage.connecting;
  }

  void updateSwitchConnectOn() {
    vpnBtnStatus.value = CcVpnBtnStatus.SELECTED;
    // vpnStage.value = VPNStage.connected;
  }

  CcVpnBtnStatus get vpnBtnStatusValue => vpnBtnStatus.value;
}
