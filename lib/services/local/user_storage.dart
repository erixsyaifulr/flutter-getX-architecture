import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorage {
  UserStorage._();

  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static const token = "token";
  static const email = "email";
  static const password = "password";

  static Future setEmail(String _email) async =>
      await storage.write(key: email, value: _email);

  static Future getEmail() async => await storage.read(key: email);

  static Future setPassword(String _password) async =>
      await storage.write(key: password, value: _password);

  static Future getPassword() async => await storage.read(key: password);

  static Future setToken(String _token) async =>
      await storage.write(key: token, value: _token);

  static Future getToken() async => await storage.read(key: token);
}
