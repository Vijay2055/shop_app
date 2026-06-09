import 'package:drift/drift.dart';

class UdharTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get customerName => text()();

  TextColumn get mobileNumber => text()();

  TextColumn get address => text()();
}
