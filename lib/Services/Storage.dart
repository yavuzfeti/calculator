import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage
{
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static String nullData = "0";

  static Future<String> read(String key) async
  {
    try
    {
      String? value = await _storage.read(key: key);
      if (value == null || value.isEmpty)
      {
        return nullData;
      }
      return value;
    }
    catch (e)
    {
      return nullData;
    }
  }

  static Future<void> write(String key, String value) async => await _storage.write(key: key, value: value);

  static Future<Map<String,String>> readAll() async => await _storage.readAll();

  static Future<void> deleteAll() async => await _storage.deleteAll();

  static Future<void> delete(String key) async => await _storage.delete(key: key);
}