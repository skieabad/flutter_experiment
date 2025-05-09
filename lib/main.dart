import 'package:flutter/material.dart';
import 'package:flutter_experiment/app.dart';
import 'package:flutter_experiment/core/service_locator.dart';
import 'package:flutter_experiment/domain/interfaces/services/i_internet_connectivity_service.dart';
import 'package:flutter_experiment/providers/experiment_copy_with_provider.dart';
import 'package:flutter_experiment/providers/internet_connectivity_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExperimentCopyWithProvider()),
        ChangeNotifierProvider(
          create:
              (_) => InternetConnectivityProvider(
                locator<IInternetConnectivityService>(),
              ),
        ),
      ],
      child: MyMaterialApp(),
    ),
  );
}
