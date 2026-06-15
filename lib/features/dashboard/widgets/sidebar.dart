import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/app/pages.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    /// 👇 Get current route
    final currentLocation = GoRouterState.of(context).uri.toString();

    return Container(
      width: 220,
      color: const Color(0xFF1F2937),
      child: Column(
        children: [
          _buildItem(
            context,
            title: "Home",
            route: Pages.homepage,
            currentLocation: currentLocation,
          ),

          _buildItem(
            context,
            title: "Billing",
            route: Pages.billing,
            currentLocation: currentLocation,
          ),

          _buildItem(
            context,
            title: "Product",
            route: Pages.category,
            currentLocation: currentLocation,
          ),

          _buildItem(
            context,
            title: "Barcode",
            route: Pages.barcodelist,
            currentLocation: currentLocation,
          ),

          _buildItem(
            context,
            title: "History",
            route: Pages.history,
            currentLocation: currentLocation,
          ),
          _buildItem(
            context,
            title: "Udhary Khata",
            route: Pages.udharyKhata,
            currentLocation: currentLocation,
          ),

          _buildItem(
            context,
            title: "Settings",
            route: Pages.settings,
            currentLocation: currentLocation,
          ),

          // _buildItem(context, title: "Utilitis", route: , currentLocation: currentLocation)
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required String title,
    required String route,
    required String currentLocation,
  }) {
    final isSelected = currentLocation == route;

    return ListTile(
      title: Text(title),
      textColor: isSelected ? Colors.white : Colors.white70,

      selected: isSelected,

      /// 🎨 Selected background color
      selectedTileColor: Colors.green.withOpacity(0.2),

      /// 👆 Hover color (desktop)
      hoverColor: Colors.white.withOpacity(0.05),

      onTap: () => context.go(route),
    );
  }
}
