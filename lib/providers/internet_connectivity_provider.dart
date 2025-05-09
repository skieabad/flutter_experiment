import 'package:flutter/material.dart';
import 'package:flutter_experiment/domain/interfaces/services/i_internet_connectivity_service.dart';

class InternetConnectivityProvider extends ChangeNotifier {
  final IInternetConnectivityService _internetConnectivityService;

  bool? _isConnected;

  bool get hasConnectionState => _isConnected != null;
  bool get isConnected => _isConnected ?? true;

  InternetConnectivityProvider(this._internetConnectivityService) {
    _initialize();
  }

  @override
  void dispose() {
    _internetConnectivityService.dispose();
    super.dispose();
  }

  void _initialize() {
    _internetConnectivityService.connectionStatusStream.listen((status) {
      if (_isConnected != status) {
        _isConnected = status;
        notifyListeners();
      }
    });
  }
}
