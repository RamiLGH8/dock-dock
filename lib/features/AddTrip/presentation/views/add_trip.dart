import 'package:app/features/AddTrip/data/models/trip_model.dart';
import 'package:app/features/AddTrip/data/repositories/TripServices.dart';
import 'package:app/features/AddTrip/presentation/components/trip_attribute_component.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddTrip extends StatefulWidget {
  const AddTrip({super.key});

  @override
  State<AddTrip> createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {
  final _formKey = GlobalKey<FormState>();
  String shipSelectedValue = 'ship1';
  String cargoSelectedValue = 'DANGEROUS_GOODS';
  String urgencySelectedValue = 'HIGH';
  String specialConditionSelectedValue = 'FIRE';

  final ships = [
    'ship1',
    'ship2',
    'ship3',
    'ship4'
  ];
  final cargos = [
    'DANGEROUS_GOODS',
    'PASSENGER',
    'CARGO',
    'MILITARY',
    'FISHING',
    'RECREATIONAL',
    'OTHER'
  ];
  final urgencies = ['HIGH', 'MEDIUM', 'LOW'];
  final specialConditions = [
    'EMERGENCY',
    'FIRE',
    'MEDICAL_EMERGENCY',
    'MALFUNCTION',
    'OTHER'
  ];
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController integerController = TextEditingController();
  final format = DateFormat("yyyy-MM-dd HH:mm");
  DateTime? departureDateTime;
  DateTime? arrivalDateTime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const Text('Create a new trip'),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TripAttributeComponent(
                        items: ships,
                        firstValue: 'ship1',
                        selectedValue: shipSelectedValue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TripAttributeComponent(
                        items: cargos,
                        firstValue: 'DANGEROUS_GOODS',
                        selectedValue: cargoSelectedValue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TripAttributeComponent(
                        items: urgencies,
                        firstValue: 'HIGH',
                        selectedValue: urgencySelectedValue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TripAttributeComponent(
                        items: specialConditions,
                        firstValue: 'EMERGENCY',
                        selectedValue: shipSelectedValue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DateTimeField(
                        format: format,
                        onChanged: (dateTime) {
                          setState(() {
                            departureDateTime = dateTime;
                          });
                        },
                        decoration: const InputDecoration(
                            labelText: 'Select Date & Hour'),
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100),
                          ).then((date) {
                            if (date != null) {
                              return showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(
                                    currentValue ?? DateTime.now()),
                              ).then((time) {
                                if (time != null) {
                                  final DateTime pickedDateTime = DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      time.hour,
                                      time.minute);
                                  return pickedDateTime;
                                } else {
                                  return currentValue;
                                }
                              });
                            } else {
                              return currentValue;
                            }
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DateTimeField(
                        format: format,
                        onChanged: (dateTime) {
                          setState(() {
                            arrivalDateTime = dateTime;
                          });
                        },
                        decoration: const InputDecoration(
                            labelText: 'Select Date & Hour'),
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100),
                          ).then((date) {
                            if (date != null) {
                              return showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(
                                    currentValue ?? DateTime.now()),
                              ).then((time) {
                                if (time != null) {
                                  final DateTime pickedDateTime = DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      time.hour,
                                      time.minute);
                                  return pickedDateTime;
                                } else {
                                  return currentValue;
                                }
                              });
                            } else {
                              return currentValue;
                            }
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        controller: integerController,
                        decoration: const InputDecoration(
                            labelText: 'Enter an Integer'),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          final trip = Trip(
                              departureTime: departureDateTime!,
                              arrivalTime: arrivalDateTime!,
                              parkingTime: int.parse(integerController.text),
                              shipName: shipSelectedValue,
                              cargoType: cargoSelectedValue,
                              urgency: urgencySelectedValue,
                              specialCondition: specialConditionSelectedValue);
                          print(trip.arrivalTime.toIso8601String());
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String? token = prefs.getString('token');
                          TripServices.AddTrip(trip,token! );
                        },
                        child: const Text('Creat Trip'))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
