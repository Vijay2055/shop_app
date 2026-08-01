// import 'package:drift/drift.dart';
// import 'package:intl/intl.dart';
// import 'package:shop_app/core/database/app_database.dart';
// import 'package:shop_app/features/homepage/data/dto/sales_graph_dto.dart';
// import 'package:shop_app/features/homepage/data/dto/sales_graph_response_dto.dart';
// import 'package:shop_app/features/homepage/data/dto/sales_summary_dto.dart';
// import 'package:shop_app/features/homepage/data/dto/topSellingDto.dart';
// import 'package:shop_app/features/homepage/data/enum/graph_range.dart';

// abstract interface class DashboardLocalDataSource {
//   /// Dashboard cards + Top 5 selling products
//   Future<DashboardSummaryDto> getDashboardSummary();

//   /// Sales graph
//   Future<SalesGraphResponseDto> getSalesGraph({required GraphRange range});
// }

// class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
//   final AppDatabase db;

//   const DashboardLocalDataSourceImpl(this.db);

//   @override
//   Future<DashboardSummaryDto> getDashboardSummary() async {
//     //---------------------------------------------------------
//     // Total Sales
//     //---------------------------------------------------------
//     final totalSalesExp = db.sales.grandTotal.sum();

//     final totalSalesRow = await (db.selectOnly(
//       db.sales,
//     )..addColumns([totalSalesExp])).getSingle();

//     final totalSales = totalSalesRow.read(totalSalesExp) ?? 0;

//     //---------------------------------------------------------
//     // Total Due
//     //---------------------------------------------------------
//     final totalDueExp = db.sales.dueAmount.sum();

//     final totalDueRow = await (db.selectOnly(
//       db.sales,
//     )..addColumns([totalDueExp])).getSingle();

//     final totalDue = totalDueRow.read(totalDueExp) ?? 0;

//     //---------------------------------------------------------
//     // Total Items Sold
//     //---------------------------------------------------------
//     final totalItemsExp = db.saleItems.quantity.sum();

//     final totalItemsRow = await (db.selectOnly(
//       db.saleItems,
//     )..addColumns([totalItemsExp])).getSingle();

//     final totalItemsSold = totalItemsRow.read(totalItemsExp) ?? 0;

//     //---------------------------------------------------------
//     // Total Profit
//     //---------------------------------------------------------
//     final saleItems = await db.select(db.saleItems).get();

//     double totalProfit = 0;

//     for (final item in saleItems) {
//       totalProfit += (item.sellingPrice - item.costPrice) * item.quantity;
//     }

//     //---------------------------------------------------------
//     // Total Invoices
//     //---------------------------------------------------------
//     final invoiceCountExp = db.sales.id.count();

//     final invoiceRow = await (db.selectOnly(
//       db.sales,
//     )..addColumns([invoiceCountExp])).getSingle();

//     final totalInvoices = invoiceRow.read(invoiceCountExp) ?? 0;

//     //---------------------------------------------------------
//     // Total Customers
//     //---------------------------------------------------------
//     final customerCountExp = db.customers.id.count();

//     final customerRow = await (db.selectOnly(
//       db.customers,
//     )..addColumns([customerCountExp])).getSingle();

//     final totalCustomers = customerRow.read(customerCountExp) ?? 0;

//     //---------------------------------------------------------
//     // Total Products
//     //---------------------------------------------------------
//     final productCountExp = db.products.id.count();

//     final productRow = await (db.selectOnly(
//       db.products,
//     )..addColumns([productCountExp])).getSingle();

//     final totalProducts = productRow.read(productCountExp) ?? 0;

//     //---------------------------------------------------------
//     // Total Variants
//     //---------------------------------------------------------
//     final variantCountExp = db.productVariants.id.count();

//     final variantRow = await (db.selectOnly(
//       db.productVariants,
//     )..addColumns([variantCountExp])).getSingle();

//     final totalVariants = variantRow.read(variantCountExp) ?? 0;

//     //---------------------------------------------------------
//     // Low Stock Products
//     //---------------------------------------------------------
//     final lowStockProducts = await (db.select(
//       db.productVariants,
//     )..where((tbl) => tbl.stock.isSmallerThan(tbl.minimumStock))).get();
//     //---------------------------------------------------------
//     // Top 5 Selling Products
//     //---------------------------------------------------------
//     final qtyExp = db.saleItems.quantity.sum();

//     final revenueExp = db.saleItems.lineTotal.sum();

//     final topSellingRows =
//         await (db.selectOnly(db.saleItems)
//               ..addColumns([
//                 db.saleItems.variantId,
//                 db.saleItems.productName,
//                 db.saleItems.variant,
//                 qtyExp,
//                 revenueExp,
//               ])
//               ..groupBy([
//                 db.saleItems.variantId,
//                 db.saleItems.productName,
//                 db.saleItems.variant,
//               ])
//               ..orderBy([OrderingTerm.desc(qtyExp)])
//               ..limit(5))
//             .get();

//     //---------------------------------------------------------
//     // Map Top Selling Products
//     //---------------------------------------------------------
//     final topSellingProducts = topSellingRows.map((row) {
//       final quantitySold = row.read(qtyExp) ?? 0;
//       final revenue = row.read(revenueExp) ?? 0.0;

//       // Profit = (Selling Price - Cost Price) × Quantity
//       // Since cost price is stored per sale item, calculate it separately.
//       final matchingItems = saleItems.where(
//         (e) => e.variantId == row.read(db.saleItems.variantId)!,
//       );

//       double profit = 0;

//       for (final item in matchingItems) {
//         profit += (item.sellingPrice - item.costPrice) * item.quantity;
//       }

//       return TopSellingDto(
//         variantId: row.read(db.saleItems.variantId)!,
//         productName: row.read(db.saleItems.productName)!,
//         sku: row.read(db.saleItems.variant)!,
//         quantitySold: quantitySold,
//         revenue: revenue,
//         profit: profit,
//       );
//     }).toList();

//     //---------------------------------------------------------
//     // Return Dashboard Summary
//     //---------------------------------------------------------
//     return DashboardSummaryDto(
//       totalSales: totalSales,
//       totalProfit: totalProfit,
//       totalDue: totalDue,
//       totalItemsSold: totalItemsSold,
//       totalInvoices: totalInvoices,
//       totalCustomers: totalCustomers,
//       totalProducts: totalProducts,
//       totalVariants: totalVariants,
//       lowStockProducts: lowStockProducts.length,
//       topSellingProducts: topSellingProducts,
//     );
//   }

//  @override
// Future<SalesGraphResponseDto> getSalesGraph({
//   required GraphRange range,
// }) async {
//   final now = DateTime.now();

//   late DateTime startDate;
//   late List<String> labels;

//   switch (range) {
//     //------------------------------------------------------
//     // Last 7 Days
//     //------------------------------------------------------
//     case GraphRange.week:
//       startDate = now.subtract(const Duration(days: 6));

//       labels = List.generate(
//         7,
//         (i) => DateFormat(
//           'EEE',
//         ).format(startDate.add(Duration(days: i))),
//       );

//       break;

//     //------------------------------------------------------
//     // Current Month
//     //------------------------------------------------------
//     case GraphRange.month:
//       startDate = DateTime(now.year, now.month, 1);

//       final days =
//           DateTime(now.year, now.month + 1, 0).day;

//       labels = List.generate(
//         days,
//         (i) => "${i + 1}",
//       );

//       break;

//     //------------------------------------------------------
//     // Current Year
//     //------------------------------------------------------
//     case GraphRange.year:
//       startDate = DateTime(now.year, 1, 1);

//       labels = const [
//         "Jan",
//         "Feb",
//         "Mar",
//         "Apr",
//         "May",
//         "Jun",
//         "Jul",
//         "Aug",
//         "Sep",
//         "Oct",
//         "Nov",
//         "Dec",
//       ];

//       break;
//   }

//   //----------------------------------------------------------
//   // Fetch sales
//   //----------------------------------------------------------

//   final sales = await (db.select(db.sales)
//         ..where(
//           (tbl) => tbl.createdAt.isBiggerOrEqualValue(
//             startDate.millisecondsSinceEpoch,
//           ),
//         ))
//       .get();

//   final Map<String, double> graph = {};

//   for (final sale in sales) {
//     final date = DateTime.fromMillisecondsSinceEpoch(
//       sale.createdAt,
//     );

//     late String key;

//     switch (range) {
//       case GraphRange.week:
//         key = DateFormat("EEE").format(date);
//         break;

//       case GraphRange.month:
//         key = "${date.day}";
//         break;

//       case GraphRange.year:
//         key = DateFormat("MMM").format(date);
//         break;
//     }

//     graph[key] =
//         (graph[key] ?? 0) + sale.grandTotal;
//   }

//   final points = labels.map((label) {
//     return SalesGraphDto(
//      label: label,
//     : graph[label] ?? 0,
      
//     );
//   }).toList();

//   return SalesGraphResponseDto(
//     range: range,
//     points: points,
//   );
// }
// }
