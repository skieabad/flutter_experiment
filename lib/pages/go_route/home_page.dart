import 'package:flutter/material.dart';
import 'package:flutter_experiment/routing/app_routing.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

class Trip {
  final String name;
  final String vehicleName;
  bool isActive;

  Trip({required this.name, required this.vehicleName, this.isActive = false});
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Trip> trips = [
    Trip(name: "Road Trip to Mountains", vehicleName: "Toyota Camry"),
    Trip(name: "Beach Weekend", vehicleName: "Honda CR-V"),
    Trip(name: "Business", vehicleName: "Tesla Model 3"),
  ];

  final Color primaryColor = Color(0xFF104C89);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'), backgroundColor: primaryColor),
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: ListView.builder(
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
                        onPressed: (context) {},
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
                        onPressed: (context) {},
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
                      onTap:
                          () => context.pushNamed(
                            AppRoute.details.name,
                            pathParameters: {
                              "name": trip.name,
                              "vehicleName": trip.vehicleName,
                            },
                          ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        title: Text(
                          trip.name,
                          style: TextStyle(
                            fontSize: 18,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              trip.vehicleName,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              trip.vehicleName,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
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
                        trailing: IconButton(
                          icon: Icon(
                            Icons.navigate_next,
                            size: 26,
                            color: primaryColor,
                          ),
                          onPressed: null,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
