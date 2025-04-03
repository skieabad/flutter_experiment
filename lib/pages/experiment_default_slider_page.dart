import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Trip {
  final String name;
  final String vehicleName;
  bool isActive;

  Trip({required this.name, required this.vehicleName, this.isActive = false});
}

class ExperimentDefaultSliderPage extends StatefulWidget {
  const ExperimentDefaultSliderPage({super.key});

  @override
  State<ExperimentDefaultSliderPage> createState() =>
      _ExperimentDefaultSliderPageState();
}

class _ExperimentDefaultSliderPageState
    extends State<ExperimentDefaultSliderPage> {
  final List<Trip> trips = [
    Trip(name: "Road Trip to Mountains", vehicleName: "Toyota Camry"),
    Trip(name: "Beach Weekend", vehicleName: "Honda CR-V"),
    Trip(name: "Business Meeting", vehicleName: "Tesla Model 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experiment Slider'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          var trip = trips[index];

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Slidable(
              useTextDirection: true,
              direction: Axis.horizontal,
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: 0.80,
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      setState(() {
                        trips.removeAt(index);
                      });
                    },
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.add,
                    label: 'Add',
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      setState(() {
                        trips.removeAt(index);
                      });
                    },
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      setState(() {
                        trips.removeAt(index);
                      });
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),
                ],
              ),
              child: Card(
                color: Colors.white,
                elevation: 1,
                child: SizedBox(
                  height: 100,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                trip.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                trip.vehicleName,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            trip.isActive ? Icons.check_circle : Icons.circle,
                            color: trip.isActive ? Colors.green : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              trip.isActive = !trip.isActive;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
