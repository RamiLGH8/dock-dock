import 'package:flutter/material.dart';

class TripDetails extends StatefulWidget {
  TripDetails(
      {required this.deck,
      required this.shipName,
      required this.departureTime,
      required this.arrivalTime,
      required this.cargoType,
      super.key});
  final String? deck;
  final String shipName;
  final String departureTime;
  final String arrivalTime;
  final String cargoType;
  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  
  @override
  Widget build(BuildContext context) {
    String deck = widget.deck!;
    final shipName = widget.shipName;
    final departureTime = widget.departureTime;
    final arrivalTime = widget.arrivalTime;
    final cargoType = widget.cargoType;
    return  SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Text('Park'),
          Text(deck),
          Text('Ship Name : '+shipName),
          Text('Departure Time : '+departureTime),
          Text('Arrival Time : '+arrivalTime),
          Text('Cargo Type : '+cargoType),
          
          ],
      ),
    ));
  }
}
