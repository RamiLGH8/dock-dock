import 'package:app/features/AddShip/data/models/ship_model.dart';

class FetchedTrip {
  final String id;
  final DateTime departureDate;
  final DateTime arrivalDate;
  final int parkingTime;
  final Ship ship;
  FetchedTrip({
    required this.id,
    required this.departureDate,
    required this.arrivalDate,
    required this.parkingTime,
    required this.ship,
  });

  factory FetchedTrip.fromJson(Map<String, dynamic> json) {
    return FetchedTrip(
      id: json['id'],
      departureDate: DateTime.parse(json['departureDate']),
      arrivalDate: DateTime.parse(json['arrivalDate']),
      parkingTime: json['parkingTime'],
      ship: Ship.fromJson(json['ship']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'departureDate': departureDate.toIso8601String(),
      'arrivalDate': arrivalDate.toIso8601String(),
      'parkingTime': parkingTime,
      'ship': ship.toJson(),
    };
  }
}
