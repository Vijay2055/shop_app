import 'package:go_router/go_router.dart';
import 'package:shop_app/app/pages.dart';
import 'package:shop_app/features/billing/presentation/screens/billing_screen.dart';
import 'package:shop_app/features/category/presentation/screens/category_screen.dart';
import 'package:shop_app/features/dashboard/layout/dashboard_layout.dart';
import 'package:shop_app/features/history/presentation/screens/history_screen.dart';
import 'package:shop_app/features/homepage/presentation/homepage_screen.dart';
import 'package:shop_app/features/product/presentation/screens/barcode_screen.dart';
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

          GoRoute(
            path: Pages.category,
            builder: (context, state) => CategoryScreen(),
          ),

          GoRoute(
            path: Pages.product,
            builder: (context, state) => ProductScreen(),
          ),
          GoRoute(
            path: Pages.barcode,
            builder: (context, state) =>
                BarcodeView(code: state.extra as String),
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
