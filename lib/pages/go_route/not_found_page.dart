import 'package:flutter/material.dart';
import 'package:flutter_experiment/routing/app_routing.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatelessWidget {
  final String error;
  const NotFoundPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 20,
            children: [
              Text("Error 404: No Page Route Found $error", style: TextStyle()),
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: Size(160, 80)),
                onPressed: () => context.go(AppRoute.home.name),
                child: Text("Navigate back to home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
