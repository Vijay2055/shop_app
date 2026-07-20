import 'package:flutter/material.dart';

class AppTableLoading extends StatelessWidget {
  const AppTableLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 350,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}