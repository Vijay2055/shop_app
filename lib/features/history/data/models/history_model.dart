// import 'package:shop_app/core/database/app_database.dart';

// class HistoryModel {
//   final String id; // unique history record ID
//   final DateTime date; // time of purchase
//   final int? udharId;
//   final double total;
//   final String? status;

//   HistoryModel({
//     required this.id,
//     this.udharId,
//     required this.total,
//     required this.date,
//     this.status,
//   });

//   factory HistoryModel.fromDrift(HistoryTableData data) {
//     return HistoryModel(
//       id: data.id,
//       total: data.total,
//       date: data.createdAt,
//       udharId: data.udharId,
//       status: data.status,
//     );
//   }
// }

// class PurchaseItem {
//   final String productId; // reference to product
//   final String productName; // snapshot of name at purchase
//   final double priceAtPurchase; // snapshot of price at purchase
//   final int quantity;

//   PurchaseItem({
//     required this.productId,
//     required this.productName,
//     required this.priceAtPurchase,
//     required this.quantity,
//   }); // how many were bought

//   PurchaseItem copyWith({
//     String? productId,
//     String? productName,
//     double? priceAtPurchase,
//     int? quantity,
//   }) {
//     return PurchaseItem(
//       productId: productId ?? this.productId,
//       productName: productName ?? this.productName,
//       priceAtPurchase: priceAtPurchase ?? this.priceAtPurchase,
//       quantity: quantity ?? this.quantity,
//     );
//   }
// }
