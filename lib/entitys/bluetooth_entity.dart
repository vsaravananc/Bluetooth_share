import 'package:flutter/foundation.dart';

class BluetoothEntity {
  const BluetoothEntity({required this.name, required this.address});
  final String name;
  final String address;

  factory BluetoothEntity.fromNative(Map<String, dynamic> data) {
    return BluetoothEntity(name: data['name'], address: data['address']);
  }
}
