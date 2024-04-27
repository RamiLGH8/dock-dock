class Trip {
  final DateTime departureTime;
  final DateTime arrivalTime;
  final int parkingTime;
  final String shipName;
  final String cargoType;
  final String urgency;
  final String? deckName;
  final String specialCondition;
 

  Trip({
    required this.departureTime,
    required this.arrivalTime,
    required this.parkingTime,
    required this.shipName,
    required this.cargoType,
    required this.urgency,
    this.deckName,
    required this.specialCondition,
   
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      departureTime: DateTime.parse(json['departureTime']),
      arrivalTime: DateTime.parse(json['arrivalTime']),
      parkingTime: json['parkingTime'],
      shipName: json['shipName'],
      cargoType: json['cargoType'],
      urgency: json['urgency'],
      deckName: json['deckName'],
      specialCondition: json['specialCondition'],
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'departureTime': departureTime.toIso8601String()+'Z',
      'arrivalTime': arrivalTime.toIso8601String()+'Z',
      'parkingTime': parkingTime,
      'shipName': shipName,
      'cargoType': cargoType,
      'urgency': urgency,
      'deckName': deckName,
      'specialCondition': specialCondition,
      
    };
  }
}
