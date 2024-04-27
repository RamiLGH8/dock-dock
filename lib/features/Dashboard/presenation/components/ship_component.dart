import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget ShipComponent(
    Icon icon, String name, String time, String day,) {
  return Container(
    color: const Color.fromRGBO(196, 222, 255, 100),
    child: ListTile(
      onTap: () {
      },
      leading: icon,
      title: Text(name),
      subtitle: Text('Arrival Time : ' + time),
      trailing: Column(
        children: [Text(day)],
      ),
    ),
  );
}
