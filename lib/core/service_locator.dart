import 'package:flutter_experiment/domain/interfaces/services/i_internet_connectivity_service.dart';
import 'package:flutter_experiment/infra/internet_connectivity_service_impl.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<IInternetConnectivityService>(
    () => InternetConnectivityServiceImpl(),
  );
}
