import 'package:flutter/material.dart';

class DevicesModel {
  static List<String> itemNames = [
    'Wifi Router',
    'Living Room Speaker',
    'Doorbell',
    'Balcony Camera',
    'Bedroom Bulb',
    'Kitchen Thermostat',
    'Lounge Smart AC',
    'Robot Vacuum',
    'Smart Door Lock',
    'Smart Lamp',
  ];

  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;

  Item(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
