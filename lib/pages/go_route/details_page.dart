import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String name;
  final String vehicleName;

  const DetailsPage({super.key, required this.name, required this.vehicleName});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(0xFF104C89);
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Trip'),
        backgroundColor: primaryColor,
      ),
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: [
                  Text(
                    'Name:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(name, style: TextStyle(fontSize: 18.0)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: [
                  Text(
                    'Vehicle Name:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(vehicleName, style: TextStyle(fontSize: 18.0)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
