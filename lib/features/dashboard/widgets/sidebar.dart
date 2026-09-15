import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/app/pages.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();

    return Material(
      color: const Color(0xFF111827),
      child: SizedBox(
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            _buildItem(
              context,
              title: 'Home',
              route: Pages.homepage,
              currentLocation: currentLocation,
            ),

            _buildItem(
              context,
              title: 'Billing',
              route: Pages.billing,
              currentLocation: currentLocation,
            ),

            _buildItem(
              context,
              title: 'Product',
              route: Pages.product,
              currentLocation: currentLocation,
            ),

            _buildItem(
              context,
              title: 'Barcode',
              route: Pages.barcodelist,
              currentLocation: currentLocation,
            ),

            _buildItem(
              context,
              title: 'History',
              route: Pages.history,
              currentLocation: currentLocation,
            ),

            _buildItem(
              context,
              title: 'Settings',
              route: Pages.settings,
              currentLocation: currentLocation,
            ),
          ],
        ),
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

    return Material(
      color: isSelected ? const Color(0xFF0B1220) : Colors.transparent,
      child: Container(
        decoration: isSelected
            ? const BoxDecoration(
                border: Border(left: BorderSide(width: 5, color: Colors.green)),
              )
            : null,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hoverColor: Colors.white10,
          title: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white70,
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          onTap: () => context.go(route),
        ),
      ),
    );
  }
}
