library flutter_session_manager;

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FlutterSessionManager {
  /// Initialize session wrapper
  final Map _session = {};

  // SharedPreferences object to store persistent data
  SharedPreferences? prefs;

  // Access and initialize the SharedPrferences instance
  Future _accessSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// Item setter
  ///
  /// @param key String
  /// @param value any
  /// @returns Future
  Future set(key, value) async {
    await _accessSharedPrefs();
    try {
      // Detect item type
      switch (value.runtimeType) {
        // String
        case String:
          {
            prefs!.setString(key, value);
          }
          break;

        // Integer
        case int:
          {
            prefs!.setInt(key, value);
          }
          break;

        // Boolean
        case bool:
          {
            prefs!.setBool(key, value);
          }
          break;

        // Double
        case double:
          {
            prefs!.setDouble(key, value);
          }
          break;

        // List<String>
        case List:
          {
            prefs!.setStringList(key, value);
          }
          break;

        // Object
        default:
          {
            prefs!.setString(key, jsonEncode(value.toJson()));
          }
      }
    } catch (e) {
      throw Exception("Key or value are not the correct type.");
    }

    // Add item to session wrapper
    _session.putIfAbsent(key, () => value);
  }
}
