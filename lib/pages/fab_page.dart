import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fab Page'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[const Text('Experiment with FAB')],
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _key,
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.menu),
          shape: const CircleBorder(),
        ),
        closeButtonBuilder: DefaultFloatingActionButtonBuilder(
          child: const Icon(Icons.close),
          fabSize: ExpandableFabSize.small,
          shape: const CircleBorder(),
          backgroundColor: Colors.redAccent,
        ),
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
