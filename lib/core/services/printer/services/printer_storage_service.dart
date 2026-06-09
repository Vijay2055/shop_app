import 'package:shared_preferences/shared_preferences.dart';

class PrinterStorageService {
  static const _printerKey = "selected_printer";

  Future<void> savePrinter(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_printerKey, name);
  }

  Future<String?> getPrinter() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_printerKey);
  }
}