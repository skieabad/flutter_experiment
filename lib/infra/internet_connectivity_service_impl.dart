import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_experiment/domain/interfaces/services/i_internet_connectivity_service.dart';

class InternetConnectivityServiceImpl implements IInternetConnectivityService {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  final StreamController<bool> _connectionStatusController =
      StreamController<bool>.broadcast();

  InternetConnectivityServiceImpl() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      event,
    ) {
      _connectionStatusController.add(
        event.any(
          (connectivityResult) => connectivityResult != ConnectivityResult.none,
        ),
      );
    });
  }

  @override
  Stream<bool> get connectionStatusStream => _connectionStatusController.stream;

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    _connectionStatusController.close();
  }
}
