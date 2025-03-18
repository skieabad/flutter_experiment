import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Trip {
  final String name;
  final String vehicleName;
  bool isActive;

  Trip({required this.name, required this.vehicleName, this.isActive = false});
}

class ExperimentSliderPage extends StatefulWidget {
  const ExperimentSliderPage({super.key});

  @override
  State<ExperimentSliderPage> createState() => _ExperimentSliderPageState();
}

class _ExperimentSliderPageState extends State<ExperimentSliderPage> {
  final List<Trip> trips = [
    Trip(name: "Road Trip to Mountains", vehicleName: "Toyota Camry"),
    Trip(name: "Beach Weekend", vehicleName: "Honda CR-V"),
    Trip(name: "Business Meeting", vehicleName: "Tesla Model 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Experiment Slider')),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              trips[index].name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (trips[index].isActive)
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(color: Colors.green),
                                child: Text(
                                  'Active',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text('Vehicle: ${trips[index].vehicleName}'),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Slidable(
                    key: ValueKey(trips[index].name),
                    direction: Axis.horizontal,
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      extentRatio: 0.35,
                      children: [
                        CustomSlidableAction(
                          onPressed: (context) {
                            if (trips[index].isActive) {
                              // End trip
                              setState(() {
                                trips[index].isActive = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Trip Ended: ${trips[index].name}',
                                  ),
                                ),
                              );
                            } else {
                              // Start trip
                              setState(() {
                                trips[index].isActive = true;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Trip Started: ${trips[index].name}',
                                  ),
                                ),
                              );
                            }
                          },
                          backgroundColor:
                              trips[index].isActive ? Colors.red : Colors.green,
                          foregroundColor: Colors.white,
                          flex: 1,
                          borderRadius: BorderRadius.circular(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                trips[index].isActive
                                    ? Icons.stop
                                    : Icons.play_arrow,
                                color: Colors.white,
                                size: 40,
                              ),
                              Text(
                                trips[index].isActive
                                    ? 'End Trip'
                                    : 'Start Trip',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    child: Container(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
