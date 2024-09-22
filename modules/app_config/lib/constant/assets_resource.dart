class AssetRes {
  static const String IC_AVATAR_DEFAULT = 'ic_default_user_avatar.png';

  static const String IC_ANALYTICS = 'ic_analytics.png';
  static const String BG_UPDATE_VERSION = 'bg_update_version.png';

  static const String IC_LOGOUT = 'ic_logout.png';
}

class AssetResLogo {
  static const String LOGO = 'app_logo.png';
}

class AssetResSplash {
  static const String BG_SPLASH = 'bg_splash.png';
}

class AssetResLoading {
  static const IC_LOADING = 'ic_loading.json';
  static const IC_COMPLETE = 'ic_complete.json';
}

String getAssetBackground({required resId}) => "packages/theme/assets/background/$resId";

String getAssetIconJson({required resId}) => "packages/theme/assets/lottie/$resId";

String getAssetIcons({required resId}) => "packages/theme/assets/icon/$resId";

String getAssetLogo({required resId}) => "packages/theme/assets/logo/$resId";
