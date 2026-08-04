import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/app/router.dart';

/// Change this date whenever you release a new version.
final DateTime kExpiryDate = DateTime(2026, 8, 30);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final isExpired = DateTime.now().isAfter(kExpiryDate);

  runApp(ProviderScope(child: MyApp(isExpired: isExpired)));
}

class MyApp extends StatelessWidget {
  final bool isExpired;

  const MyApp({super.key, required this.isExpired});

  @override
  Widget build(BuildContext context) {
    if (isExpired) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hina Enterprises POS',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const ExpiredScreen(),
      );
    }

    return MaterialApp.router(
      title: 'Hina Enterprises POS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: AppRouter.router,
    );
  }
}

class ExpiredScreen extends StatelessWidget {
  const ExpiredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.lock_clock_rounded, size: 80, color: Colors.red),
                SizedBox(height: 20),
                Text(
                  "Application Expired",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Text(
                  "This version of Hina Enterprises POS has expired.\n\nPlease contact the developer for the latest version.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  "Developer: Bijay Yadav",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
