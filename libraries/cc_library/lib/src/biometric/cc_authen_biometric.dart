import 'package:cc_library/extension/logger.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class CcAuthenBiometric {
  final LocalAuthentication auth = LocalAuthentication();
  bool canAuthenticate = false;

  Future onCreate() async {
    canAuthenticate = await auth.canCheckBiometrics || await auth.isDeviceSupported();
  }

  Future onAuthen() async {
    var isAuthSuccess = false;
    if (canAuthenticate) {
      try {
        isAuthSuccess = await auth.authenticate(
          localizedReason: 'Please authenticate to show account balance',
          authMessages: [
            AndroidAuthMessages(
              signInTitle: 'Oops! Biometric authentication required!',
              cancelButton: 'No thanks',
            ),
            IOSAuthMessages(
              cancelButton: 'No thanks',
            ),
          ],
          options: const AuthenticationOptions(
            useErrorDialogs: false,
          ),
        );
      } on PlatformException catch (e) {
        if (e.code == auth_error.notEnrolled) {
          // Add handling of no hardware here.
        } else if (e.code == auth_error.lockedOut || e.code == auth_error.permanentlyLockedOut) {
        } else {}
      }
    } else {
      "canAuthenticate :.. ${canAuthenticate} ".Log();
    }
    return isAuthSuccess;
  }
}
