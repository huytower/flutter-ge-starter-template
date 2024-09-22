import 'package:flutter/material.dart';

import '../../presentation/base/structure/getx/cc_get_controller/cc_get_controller.dart';
import '../../presentation/base/structure/getx/cc_get_view/cc_get_view.dart';

/// Target: Support [complex widgets] (UI structure),
/// include these methods (like impl interface)
/// - Header widget, ex., top floating bar, search bar ...
/// - Body|Content widget : ex., pull to refresh, retry request api btn ...
/// - Footer widget : bottom floating bar, ...
///...
/// For UI only,
/// serve for how to develop Widget
///
/// core sdk
mixin CcGetViewProvider<T extends CcGetController> on CcGetView<T> {
  /// is main popup show on page, ex. Ads popup ...
  Widget buildAdsPopup() => const SizedBox();

  /// is bar show on virtual keyboard, ex. otp bar ...
  Widget buildBottomFloatingBar() => const SizedBox();

  /// is cancel request api button, ex. cancel large downloading progress ...
  Widget buildCancelRequestBtn() => const SizedBox();

  /// is minimize popup show on page, ex. bottom-left banner image ...
  Widget buildMiniAdsPopup() => const SizedBox();

  /// is pull to refresh action, ex. refresh||retry request api ...
  Widget buildPullToRefresh() => const SizedBox();

  /// is retry request api button, ex. retry failed downloading progress ...
  Widget buildRetryRequestBtn() => const SizedBox();

  /// is search bar, always show at top screen
  Widget buildSearchBar() => const SizedBox();

  /// is bar show below search bar, ex. section bar, category bar ...
  Widget buildTopFloatingBar() => const SizedBox();
}
