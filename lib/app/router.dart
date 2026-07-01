import 'dart:typed_data';

import 'package:go_router/go_router.dart';
import 'package:shop_app/app/pages.dart';
import 'package:shop_app/features/barcode/presentation/screen/barcode_preview_screen.dart';
import 'package:shop_app/features/barcode/presentation/screen/barcode_product_list.dart';
import 'package:shop_app/features/barcode/presentation/screen/pdf_preview_screen.dart';
import 'package:shop_app/features/billing/presentation/screens/billing_screen.dart';
import 'package:shop_app/features/category/presentation/screens/category_screen.dart';
import 'package:shop_app/features/dashboard/layout/dashboard_layout.dart';
import 'package:shop_app/features/history/presentation/screens/history_screen.dart';
import 'package:shop_app/features/homepage/presentation/homepage_screen.dart';
import 'package:shop_app/features/product/presentation/screens/product_screen.dart';
import 'package:shop_app/features/settings/printer_screen.dart';
import 'package:shop_app/features/udhar/presentation/screens/udhar_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) => DashboardLayout(child: child),
        routes: [
          GoRoute(
            path: Pages.homepage,
            builder: (context, state) => HomepageScreen(),
          ),
          GoRoute(
            path: Pages.billing,
            builder: (context, state) => BillingScreen(),
          ),
          GoRoute(
            path: Pages.history,
            builder: (context, state) => HistoryScreen(),
          ),

          // GoRoute(
          //   path: Pages.category,
          //   builder: (context, state) => CategoryScreen(),
          // ),

          // GoRoute(
          //   path: Pages.product,
          //   builder: (context, state) => ProductScreen(),
          // ),
          GoRoute(
            path: Pages.barcode,
            builder: (context, state) => BarcodePreviewScreen(),
          ),

          // GoRoute(
          //   path: Pages.barcodelist,
          //   builder: (context, state) => BarcodeProductList(),
          // ),

          GoRoute(
            path: Pages.pdfPreview,
            builder: (context, state) => PdfPreviewScreen(pdfBytes: state.extra as Uint8List),
          ),

          GoRoute(
            path: Pages.udharyKhata,
            builder: (context, state) => UdharScreen(),
          ),

          GoRoute(
            path: Pages.settings,
            builder: (context, state) => PrinterSettingsScreen(),
          ),
        ],
      ),
    ],
  );
}
