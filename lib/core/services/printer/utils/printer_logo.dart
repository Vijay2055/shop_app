import 'package:flutter/services.dart';

Future<Uint8List?> convertToBytes() async {
  final bytes = await rootBundle.load('assets/logo.jpeg');
  final logoBytes = bytes.buffer.asUint8List();
  return logoBytes;
}
