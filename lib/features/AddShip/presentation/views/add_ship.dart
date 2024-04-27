import 'package:app/features/AddShip/data/models/ship_model.dart';
import 'package:app/features/AddShip/data/repositories/ShipServices.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddShip extends StatefulWidget {
  const AddShip({super.key});

  @override
  State<AddShip> createState() => _AddShipState();
}

class _AddShipState extends State<AddShip> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Add a new ship',
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 200,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: name,
                            decoration: const InputDecoration(
                                hintText: 'Enter ship name',
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'enter height';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                name.text = value;
                              });
                            },
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: heightController,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true), // Allow decimal input
                            decoration: const InputDecoration(
                              hintText:
                                  'enter height in meters', // Update hintText
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the height';
                              }
                              return null;
                            },

                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: widthController,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true), // Allow decimal input
                            decoration: const InputDecoration(
                              hintText:
                                  'enter width in meters', // Update hintText
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the width';
                              }
                              return null;
                            },

                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                        const SizedBox(height: 200),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue), // Background color blue
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.white), // Text color white
                          ),
                          onPressed: () async {
                            // Validate form
                            if (name.text.isEmpty ||
                                heightController.text.isEmpty ||
                                widthController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill the filds'),
                                ),
                              );
                              return;
                            }

                            // Create Toilet object
                            final ship = Ship(
                                name: name.text,
                                height: int.parse(heightController.text),
                                width: int.parse(widthController.text));

                            // Add toilet
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            String? token = prefs.getString('token');
                            print(token);
                            await ShipServices.AddShip(ship, token!);

                            // Show success message or navigate to another screen
                          },
                          child: const Text('Add Ship'),
                        ),
                      ],
                    ),
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
