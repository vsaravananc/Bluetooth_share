abstract class BluetoothRepo {
  Future<bool?> statusOfBlueTooth();
  Future<bool?> requestPermission();
  Future<bool?> checkBlueToothTrunOn();
  Future<bool?> setBlueToothName(String name);
}
