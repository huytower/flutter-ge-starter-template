/// Target: Support [complex widgets] (UI structure)
/// details about more component actions, ex. :
/// - pull to refresh
/// - click ads
/// - click retry to request api again
/// ...
/// For Controller only
/// serve for how to request||call api||logic
mixin CcGetControllerProvider {
  /// is main popup show on page, ex. Ads popup ...
  Future<void> onTapAdsPopup() async {}

  /// is bar show on virtual keyboard, ex. otp bar ...
  Future<void> onTapBottomFloatingBar() async {}

  /// is cancel request api button, ex. cancel large downloading progress ...
  Future<void> onCancelRequest() async {}

  /// is pull to refresh action, ex. refresh||retry request api ...
  Future<void> onPullToRefresh() async {}

  /// is minimize popup show on page, ex. bottom-left banner image ...
  Future<void> onTapMiniAdsPopup() async {}

  /// is retry request api button, ex. retry failed downloading progress ...
  Future<void> onRetryRequest() async {}

  /// is search bar, always show at top screen
  Future<void> onTapSearchBar() async {}

  /// is bar show below search bar, ex. section bar, category bar ...
  Future<void> onTapTopFloatingBar() async {}
}
