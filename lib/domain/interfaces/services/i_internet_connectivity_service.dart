abstract interface class IInternetConnectivityService {
  Stream<bool> get connectionStatusStream;
  void dispose();
}
