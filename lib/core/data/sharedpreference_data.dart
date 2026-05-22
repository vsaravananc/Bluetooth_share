import 'package:bluetooh_share/core/data/abstract_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedpreferenceData extends AbstractDataBase {
  final FlutterSecureStorage storage;

  SharedpreferenceData(this.storage);

  @override
  Future<void> clear() async {
    await storage.deleteAll();
  }

  @override
  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  @override
  Future<T> get<T>(String key) async {
    return await storage.read(key: key) as T;
  }

  @override
  Future<void> set<T>(String key, T value) async {
    if (T is! String) {
      await storage.write(key: key, value: value.toString());
    } else {
      await storage.write(key: key, value: value as String?);
    }
  }
}
