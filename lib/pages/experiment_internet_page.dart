import 'package:flutter/material.dart';
import 'package:flutter_experiment/providers/internet_connectivity_provider.dart';
import 'package:provider/provider.dart';

class ExperimentInternetPage extends StatefulWidget {
  const ExperimentInternetPage({super.key});

  @override
  State<ExperimentInternetPage> createState() => _ExperimentInternetPageState();
}

class _ExperimentInternetPageState extends State<ExperimentInternetPage> {
  bool? isConnected;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      isConnected = context.read<InternetConnectivityProvider>().isConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment Internet Page')),
      body: Center(
        child: Text(
          (isConnected ?? false)
              ? "Connected to internet"
              : "Not connected to internet",
          style: TextStyle(
            fontSize: 22,
            color: (isConnected ?? false) ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}
