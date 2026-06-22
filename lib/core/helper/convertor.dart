import 'package:bluetooh_share/entitys/bluetooth_entity.dart';

List<BluetoothEntity> convertListOfBlueToothEntity(List<Object?> data) {
  return data
      .map(
        (e) => BluetoothEntity.fromNative(
          Map<String, dynamic>.from(e as Map<Object?, Object?>),
        ),
      )
      .toList();
}
