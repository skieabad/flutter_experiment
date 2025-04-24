import 'package:flutter/material.dart';

class ExperimentPage extends StatelessWidget {
  final VoidCallback onNavigateToFullScreenPage;

  const ExperimentPage({super.key, required this.onNavigateToFullScreenPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment Page')),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: onNavigateToFullScreenPage,
            child: const Text('Go to Full Screen Page'),
          ),
        ),
      ),
    );
  }
}
