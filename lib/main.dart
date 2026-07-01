import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shop_app/features/category/presentation/screens/category_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // routerConfig: AppRouter.router,
      home:CategoryScreen(),
      
    );
  }

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   final init = ref.watch(appInitProvider);
  //   return init.when(
  //     data: (_) => MaterialApp.router(
  //       title: 'Flutter Demo',
  //       debugShowCheckedModeBanner: false,
  //       theme: ThemeData(
  //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //       ),
  //       routerConfig: AppRouter.router,
  //     ),
  //     error: (e, _) => MaterialApp(
  //       home: Scaffold(body: Center(child: Text("Init Error: $e"))),
  //     ),
  //     loading: () => const MaterialApp(
  //       home: Scaffold(body: Center(child: CircularProgressIndicator())),
  //     ),
  //   );
  // }
}
