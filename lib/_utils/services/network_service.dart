// Dart imports:
import 'dart:async';

// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';

// Project imports:
import '../constants/app_constants.dart';

class InernetConnectivityService {
  final Connectivity _connectivity = Connectivity();

  final StreamController<bool> _connectionChangeController =
      StreamController.broadcast();

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  InernetConnectivityService.init() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((dataConnectionStatus) {
      isConnected = dataConnectionStatus == ConnectivityResult.mobile ||
          dataConnectionStatus == ConnectivityResult.wifi;

      _connectionChangeController.add(isConnected);
    });
  }

  Stream<bool> get connectivityStatus => _connectionChangeController.stream;

  void dispose() {
    _connectivitySubscription.cancel();
  }
}
