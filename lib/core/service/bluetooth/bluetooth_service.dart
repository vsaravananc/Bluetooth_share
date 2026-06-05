import 'package:bluetooh_share/core/service/bluetooth/bluetooth_repo.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

final class BluetoothService implements BluetoothRepo {
  final MethodChannel _methodChannel = const MethodChannel(
    'com.example.bluetooh_share/bluetooth',
  );
  final String _checkBluetoothTurnOnMethod = 'checkBluetoothTurnOn';
  final String _setBluetoothNameMethod = 'setBluetoothName';
  final String _getBluetoothDevicesMethod = 'getBlueToothDevicesBound';

  @override
  Future<bool> statusOfBlueTooth() async {
    try {
      return (await Permission.bluetoothScan.isGranted &&
          await Permission.bluetoothAdvertise.isGranted &&
          await Permission.bluetoothConnect.isGranted);
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> requestPermission() async {
    try {
      final request = [
        Permission.bluetoothAdvertise,
        Permission.bluetoothConnect,
        Permission.bluetoothScan,
      ];
      final response = await request.request();
      if (response[Permission.bluetoothScan] ==
          PermissionStatus.permanentlyDenied) {
        await openAppSettings();
        return await statusOfBlueTooth();
      }
      return await statusOfBlueTooth();
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool?> checkBlueToothTrunOn() async {
    try {
      final bool isTurnOn = await _methodChannel.invokeMethod(
        _checkBluetoothTurnOnMethod,
      );
      return isTurnOn;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool?> setBlueToothName(String name) async {
    try {
      await Permission.bluetoothConnect.request();
      return await _methodChannel.invokeMethod(_setBluetoothNameMethod, {
        "name": name,
      });
    } catch (_) {
      return false;
    }
  }
  
  @override
  Future<void> getBlueToothDevices() async {
    try {
      await _methodChannel.invokeMethod(_getBluetoothDevicesMethod);
    } catch (e) {
      debugPrint("Error Getting Bluetooth Devices: $e");
    }
  }
}

final class NullBluetoothService implements BluetoothRepo {
  @override
  Future<bool?> requestPermission() async {
    return null;
  }

  @override
  Future<bool?> statusOfBlueTooth() async {
    return null;
  }

  @override
  Future<bool?> checkBlueToothTrunOn() async {
    return null;
  }

  @override
  Future<bool?> setBlueToothName(String name) async {
    return null;
  }
  
  @override
  Future<void> getBlueToothDevices() {
    // TODO: implement getBlueToothDevices
    throw UnimplementedError();
  }
}
