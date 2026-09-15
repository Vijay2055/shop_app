import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/app/pages.dart';
import 'package:shop_app/features/product/presentation/enum/product_action.dart';

class ProductActionMenu extends StatelessWidget {
  const ProductActionMenu({
    super.key,
    required this.isActive,
    required this.onSelected,
  });

  final bool isActive;
  final ValueChanged<ProductAction> onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ProductAction>(
      icon: const Icon(Icons.more_vert),
      onSelected: onSelected,
      itemBuilder: (_) => [
        PopupMenuItem(
          value: ProductAction.view,

          child: ListTile(
            onTap: () {
              context.push(Pages.addEditProduct, extra: null);
            },
            leading: Icon(Icons.visibility_outlined),
            title: Text('View'),
          ),
        ),
         PopupMenuItem(
          value: ProductAction.edit,
          child: ListTile(
            onTap: (){
              context.push(Pages.addEditProduct, extra: null);
            },
            leading: Icon(Icons.edit_outlined),
            title: Text('Edit'),
          ),
          // ),
          // const PopupMenuItem(
          //   value: ProductAction.delete,
          //   child: ListTile(
          //     leading: Icon(Icons.delete_outline),
          //     title: Text('Delete'),
          //   ),
          // ),
          // PopupMenuItem(
          //   value: ProductAction.enable,
          //   child: ListTile(
          //     leading: Icon(
          //       isActive
          //           ? Icons.visibility_off_outlined
          //           : Icons.visibility_outlined,
          //     ),
          //     title: Text(
          //       isActive ? 'Disable' : 'Enable',
          //     ),
          //   ),
        ),
      ],
    );
  }
}
