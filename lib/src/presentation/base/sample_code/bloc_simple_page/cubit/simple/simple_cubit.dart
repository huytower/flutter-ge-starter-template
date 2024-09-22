import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/extension/app_tracking_log_extension.dart';
import 'simple_cubit_state.dart';

/// CUBIT : CONTROLLER
/// Step 1 : create Controller + State + Event (if need)
@lazySingleton
class SimpleCubit extends Cubit<SimpleCubitState> {
  @factoryMethod
  SimpleCubit() : super(SimpleCubitState().init());

  int counter = 0;

  void increase() {
    try {
      counter++;

      emit(state.clone());
    } catch (e) {
      e.addAppTrackingLog();
    }
  }

  // void addTestAppTrackingLog() {
  //   // 1.delay(() {
  //     try {
  //       throw SocketException('');
  //     } catch (e) {
  //       e.addAppTrackingLog();
  //     }
  //     try {
  //       throw FormatException();
  //     } catch (e) {
  //       e.addAppTrackingLog();
  //     }
  //     try {
  //       throw FileSystemException();
  //     } catch (e) {
  //       e.addAppTrackingLog();
  //     }
  //
  //     // throw const CertificateException();
  //   // });
  // }
}

