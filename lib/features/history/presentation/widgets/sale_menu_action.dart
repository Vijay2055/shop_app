import 'package:flutter/material.dart';
import 'package:shop_app/features/history/presentation/enum/menu_enum.dart';

class SaleHistoryActionMenu extends StatelessWidget {
  const SaleHistoryActionMenu({
    super.key,
    required this.isCredit,
    required this.hasDue,
    required this.onSelected,
  });

  final bool isCredit;
  final bool hasDue;
  final ValueChanged<SaleHistoryAction> onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SaleHistoryAction>(
      tooltip: "Actions",
      onSelected: onSelected,
      itemBuilder: (_) => [
        const PopupMenuItem(
          value: SaleHistoryAction.view,
          child: ListTile(
            leading: Icon(Icons.visibility_outlined),
            title: Text("View"),
            dense: true,
          ),
        ),

        const PopupMenuItem(
          value: SaleHistoryAction.delete,
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text("Delete"),
            dense: true,
          ),
        ),
      ],
    );
  }
}
