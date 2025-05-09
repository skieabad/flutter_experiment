import 'package:flutter/material.dart';
import 'package:flutter_experiment/pages/experiment_internet_page.dart';

class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp({super.key});

  @override
  State<MyMaterialApp> createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiments',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      // home: ExperimentCopyWithPage(),
      // home: ExperimentDefaultSliderPage(),
      // home: ExperimentOnBoardingPage(),
      // home: ExperimentContainer(),
      // home: ExperimentDetailsPage(),
      home: ExperimentInternetPage(),
      // routerConfig: goRouter,
    );
  }
}
