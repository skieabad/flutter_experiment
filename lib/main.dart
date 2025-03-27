import 'package:flutter/material.dart';
import 'package:flutter_experiment/app.dart';
import 'package:flutter_experiment/providers/experiment_copy_with_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExperimentCopyWithProvider()),
      ],
      child: MyMaterialApp(),
    ),
  );
}
