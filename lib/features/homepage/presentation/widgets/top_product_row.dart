import 'package:flutter/material.dart';

class TopProductRow extends StatelessWidget {
  const TopProductRow({super.key,required this.name,required this.value});
  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Text(value.toString(), style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}