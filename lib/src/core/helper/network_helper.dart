import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@singleton
class NetworkHelper {
  const NetworkHelper(this.network);

  final InternetConnectionChecker network;

  Future<bool> get hasInternet => network.hasConnection;
}
