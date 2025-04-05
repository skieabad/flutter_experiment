import 'dart:developer';

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
      backgroundColor: Colors.grey.shade300,
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          var trip = trips[index];

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Slidable(
                useTextDirection: true,
                direction: Axis.horizontal,
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  extentRatio: 0.5,
                  children: [
                    CustomSlidableAction(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.all(0),
                      autoClose: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.more_horiz),
                          SizedBox(height: 4),
                          Text('More'),
                        ],
                      ),
                      onPressed: (context) {
                        _showMoreOptions(context, trip);
                      },
                    ),
                    CustomSlidableAction(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.archive),
                          SizedBox(height: 4),
                          Text('Archive'),
                        ],
                      ),
                      onPressed: (context) {
                        log("Archived ${trip.name}");
                        // Handle archive action
                      },
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(25, 0, 0, 0),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      log("you tapped ${trip.name}");
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      title: Text(
                        trip.name,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF104C89),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            trip.vehicleName,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            trip.vehicleName,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            trip.vehicleName,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.navigate_next,
                          size: 26,
                          color: Color(0xFF104C89),
                        ),
                        onPressed: () {},
                      ),
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

  void _showMoreOptions(BuildContext context, Trip trip) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Options for ${trip.name}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF104C89),
                  ),
                ),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.edit, color: Colors.blue),
                title: Text('Edit Trip'),
                onTap: () {
                  Navigator.pop(context);
                  log("Edit ${trip.name}");
                  // Handle edit logic
                },
              ),
              ListTile(
                leading: Icon(Icons.share, color: Colors.green),
                title: Text('Share Trip'),
                onTap: () {
                  Navigator.pop(context);
                  log("Share ${trip.name}");
                  // Handle share logic
                },
              ),
              ListTile(
                leading: Icon(Icons.content_copy, color: Colors.orange),
                title: Text('Duplicate Trip'),
                onTap: () {
                  Navigator.pop(context);
                  log("Duplicate ${trip.name}");
                  // Handle duplicate logic
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text('Delete Trip'),
                onTap: () {
                  Navigator.pop(context);
                  log("Delete ${trip.name}");
                  // Handle delete logic
                },
              ),
              SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
