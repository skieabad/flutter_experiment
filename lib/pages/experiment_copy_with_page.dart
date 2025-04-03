import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_experiment/models/trip.dart';
import 'package:flutter_experiment/providers/experiment_copy_with_provider.dart';
import 'package:provider/provider.dart';

class ExperimentCopyWithPage extends StatelessWidget {
  const ExperimentCopyWithPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExperimentCopyWithProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment CopyWith'),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child:
            provider.trips.isEmpty
                ? Center(child: Text('No trips for now'))
                : ListView.builder(
                  itemCount: provider.trips.length,
                  itemBuilder: (context, index) {
                    final trip = provider.trips[index];

                    return ListTile(
                      title: Text(trip.title),
                      subtitle: Text(trip.description),
                      trailing:
                          trip.status == TripStatus.completed
                              ? Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  'Completed',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                              : IconButton(
                                icon: Icon(Icons.check),
                                onPressed: () {
                                  log(
                                    'Marking trip as completed: ${trip.title}',
                                  );
                                  provider.markAsCompletedDuplicate(trip);
                                },
                              ),
                    );
                  },
                ),
      ),
    );
  }
}
