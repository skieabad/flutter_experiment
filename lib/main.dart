import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_experiment/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: FlutterExperimentColors.primaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: FlutterExperimentColors.primaryColor,
          primary: FlutterExperimentColors.primaryColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: FlutterExperimentColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: FlutterExperimentColors.primaryColor,
          foregroundColor: Colors.white,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[const Text('Hello world!')],
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _key,
        type: ExpandableFabType.up,
        childrenAnimation: ExpandableFabAnimation.none,
        distance: 70,
        overlayStyle: ExpandableFabOverlayStyle(
          // color: Colors.white.withValues(alpha: 0.9),
          blur: 5,
        ),
        children: const [
          Row(
            spacing: 20,
            children: [
              Text('Enter serial number'),
              FloatingActionButton.small(
                shape: CircleBorder(),
                heroTag: null,
                onPressed: null,
                child: Icon(Icons.more),
              ),
            ],
          ),
          Row(
            spacing: 20,
            children: [
              Text('Scan Gateway'),
              FloatingActionButton.small(
                shape: CircleBorder(),
                heroTag: null,
                onPressed: null,
                child: Icon(Icons.camera_alt),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
