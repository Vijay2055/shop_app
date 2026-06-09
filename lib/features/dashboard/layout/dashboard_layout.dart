import 'package:flutter/material.dart';
import 'package:shop_app/features/dashboard/widgets/header.dart';
import 'package:shop_app/features/dashboard/widgets/sidebar.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          Expanded(
            child: Row(
              children: [
                Sidebar(),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
