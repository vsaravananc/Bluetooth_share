import 'package:bluetooh_share/core/service/bluetooth_repo.dart';
import 'package:permission_handler/permission_handler.dart';

final class BluetoothService implements BluetoothRepo {
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
}
