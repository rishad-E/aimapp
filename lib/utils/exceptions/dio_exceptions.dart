import 'package:connectivity_plus/connectivity_plus.dart';

class ApiExceptions {
  late String errorMessage;
  ApiExceptions.fromconnectivityError(ConnectivityResult connectivityResult) {
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
        errorMessage = 'wifi';
        // errorMessage = 'connected to wifi';
        break;
      case ConnectivityResult.mobile:
        errorMessage = 'mobile';
        // errorMessage = 'connected to mobile';
        break;
      case ConnectivityResult.none:
        errorMessage = 'not internet';
        // errorMessage = 'not connected to internet';
        break;
      default:
        errorMessage = 'unexpected error';
        // errorMessage = 'unexpected connectivity error';
        break;
    }
  }
}
