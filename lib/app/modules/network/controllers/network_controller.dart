import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  //TODO: Implement NetworkController
  var connectionStatus = 0.obs;
  Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    initConnection();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }

  void increment() => count.value++;

  Future<void> initConnection() async {
    ConnectivityResult _result = ConnectivityResult.none;
    try {
      _result = await _connectivity.checkConnectivity();
    } catch (e) {
      Get.snackbar("Error", "Network Error");
    }
    return _updateConnectionStatus(_result);
  }

  _updateConnectionStatus(ConnectivityResult _result) {
    switch (_result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;

        break;

      default:
        Get.snackbar("NO INTERNET", "There is no internet connection");
        break;
    }
  }
}
