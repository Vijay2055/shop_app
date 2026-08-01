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
          value: SaleHistoryAction.print,
          child: ListTile(
            leading: Icon(Icons.print_outlined),
            title: Text("Print"),
            dense: true,
          ),
        ),

        const PopupMenuItem(
          value: SaleHistoryAction.pdf,
          child: ListTile(
            leading: Icon(Icons.picture_as_pdf_outlined),
            title: Text("Export PDF"),
            dense: true,
          ),
        ),

        if (isCredit && hasDue)
          const PopupMenuItem(
            value: SaleHistoryAction.receivePayment,
            child: ListTile(
              leading: Icon(Icons.payments_outlined),
              title: Text("Receive Payment"),
              dense: true,
            ),
          ),

        const PopupMenuItem(
          value: SaleHistoryAction.editNote,
          child: ListTile(
            leading: Icon(Icons.edit_note),
            title: Text("Edit Note"),
            dense: true,
          ),
        ),

        const PopupMenuDivider(),

        const PopupMenuItem(
          value: SaleHistoryAction.cancel,
          child: ListTile(
            leading: Icon(
              Icons.cancel_outlined,
              color: Colors.red,
            ),
            title: Text(
              "Cancel Sale",
              style: TextStyle(color: Colors.red),
            ),
            dense: true,
          ),
        ),
      ],
    );
  }
}