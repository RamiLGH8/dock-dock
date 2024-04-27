import 'package:flutter/material.dart';

final Map<String, Color> colors = {
  'Free': Colors.green,
  'Occupied': Colors.red,
  'Out of Service': Colors.orange,
};
Widget DockComponent(String status, int number) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(245, 249, 254, 100),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromRGBO(57, 148, 255, 100))),
      height: 200,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            status,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            number.toString(),
            style: TextStyle(color: colors[status],fontSize: 30),
          )
        ],
      ),
    ),
  );
}
