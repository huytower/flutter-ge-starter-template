class ExtensionUtils {
  static const String EXTENSION_JPG = '.jpg';
  static const String EXTENSION_LOTTIE = '.json';
  static const String EXTENSION_PNG = '.png';
  static const String EXTENSION_SVG = '.svg';

  static bool isJpgExtension(String path) => path.contains(EXTENSION_JPG);

  static bool isPngExtension(String path) => path.contains(EXTENSION_LOTTIE);

  static bool isLottieExtension(String path) => path.contains(EXTENSION_PNG);

  static bool isSvgExtension(String path) => path.contains(EXTENSION_SVG);
}
