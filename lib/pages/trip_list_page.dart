import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Trip {
  final String name;
  final String vehicleName;
  bool isActive;

  Trip({required this.name, required this.vehicleName, this.isActive = false});
}

class TripListPage extends StatefulWidget {
  const TripListPage({super.key});

  @override
  State<TripListPage> createState() => _TripListPageState();
}

class _TripListPageState extends State<TripListPage> {
  final List<Trip> trips = [
    Trip(name: "Road Trip to Mountains", vehicleName: "Toyota Camry"),
    Trip(name: "Beach Weekend", vehicleName: "Honda CR-V"),
    Trip(name: "Business Meeting", vehicleName: "Tesla Model 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trip List')),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Slidable(
              key: ValueKey(trips[index].name),
              direction: Axis.horizontal,
              // startActionPane - swipe left
              // rightActionPane - swipe right
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: 0.40,
                children: [
                  CustomSlidableAction(
                    onPressed: (context) {
                      if (trips[index].isActive) {
                        setState(() {
                          trips[index].isActive = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Trip Ended: ${trips[index].name}'),
                          ),
                        );

                        return;
                      }

                      setState(() {
                        trips[index].isActive = true;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Trip Started: ${trips[index].name}'),
                        ),
                      );
                    },
                    backgroundColor:
                        trips[index].isActive ? Colors.red : Colors.green,
                    foregroundColor: Colors.white,
                    flex: 1,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 4,
                      children: [
                        Icon(
                          trips[index].isActive ? Icons.stop : Icons.play_arrow,
                          color: Colors.white,
                          size: 40,
                        ),
                        Text(
                          trips[index].isActive ? 'End Trip' : 'Start Trip',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
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
                    spacing: 8,
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
                      Text('Vehicle: ${trips[index].vehicleName}'),
                    ],
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
