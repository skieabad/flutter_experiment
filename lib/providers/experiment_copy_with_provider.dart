import 'package:flutter/material.dart';
import 'package:flutter_experiment/models/trip.dart';

class ExperimentCopyWithProvider extends ChangeNotifier {
  final List<Trip> _trips = [
    Trip(
      id: '1',
      title: 'Trip to Paris',
      description: 'Paris, the city of love',
      status: TripStatus.upcoming,
    ),
    Trip(
      id: '2',
      title: 'Trip to New York',
      description: 'The big apple',
      status: TripStatus.ongoing,
    ),
    Trip(
      id: '3',
      title: 'Trip to London',
      description: 'The British capital',
      status: TripStatus.upcoming,
    ),
    Trip(
      id: '4',
      title: 'Trip to Tokyo',
      description: 'The Japanese capital',
      status: TripStatus.upcoming,
    ),
    Trip(
      id: '5',
      title: 'Trip to Sydney',
      description: 'The Australian capital',
      status: TripStatus.upcoming,
    ),
    Trip(
      id: '6',
      title: 'Trip to Rome',
      description: 'The Italian capital',
      status: TripStatus.completed,
    ),
  ];

  List<Trip> get trips => _trips;

  // Approach 1
  void markAsCompleted(Trip selectedTrip) {
    final index = _trips.indexWhere((trip) => trip.id == selectedTrip.id);

    if (index == -1) {
      return;
    }

    final selectedTripCopy = selectedTrip.copyWith(
      status: TripStatus.completed,
    );

    _trips[index] = selectedTripCopy;
    notifyListeners();
  }

  // Approach 2
  void markAsCompletedDuplicate(Trip selectedTrip) {
    final index = _trips.indexWhere((trip) => trip.id == selectedTrip.id);

    if (index == -1) {
      return;
    }

    _trips[index] = selectedTrip.copyWith(status: TripStatus.completed);
    notifyListeners();
  }
}
