import 'package:shop_app/features/history/data/models/history_model.dart';

class HistoryDetailModel {
  final String id;
  final DateTime date;
  final double totalAmount;
  final String status;
  final List<PurchaseItem> items;

  HistoryDetailModel({
   required this.status,
    required this.id,
    required this.date,
    required this.totalAmount,
    required this.items,
  });
}
