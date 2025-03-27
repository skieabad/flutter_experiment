import 'package:flutter/material.dart';

enum TripStatus { upcoming, ongoing, completed }

// To explore packages
// https://pub.dev/packages/freezed
// https://pub.dev/packages/json_serializable
// https://pub.dev/packages/json_annotation
// https://pub.dev/packages/build_runner

@immutable
class Trip {
  final String id;
  final String title;
  final String description;
  final TripStatus status;

  const Trip({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  Trip copyWith({
    String? id,
    String? title,
    String? description,
    TripStatus? status,
  }) {
    return Trip(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }
}
