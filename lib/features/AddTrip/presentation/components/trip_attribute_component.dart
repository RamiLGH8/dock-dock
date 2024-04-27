import 'package:flutter/material.dart';

class TripAttributeComponent extends StatefulWidget {
  final List<String> items;
  final String firstValue;
  String selectedValue;

   TripAttributeComponent({
    required this.items,
    required this.firstValue,
    required this.selectedValue,
    Key? key,
  }) : super(key: key);

  @override
  _TripAttributeComponentState createState() => _TripAttributeComponentState();
}

class _TripAttributeComponentState extends State<TripAttributeComponent> {
  

 

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      
      value: widget.firstValue,
      items: widget.items.map
      <DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        if (value != null) {
          setState(() {
            widget.selectedValue = value;
          });
        }
      },
      
      decoration: const InputDecoration(labelText: 'Location Type'),
    );
  }
}
