import 'package:flutter/material.dart';

class InventoryNavbar extends StatelessWidget implements PreferredSizeWidget {
  const InventoryNavbar({super.key});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: Card(
        elevation: 26.0,
        color: Colors.white,
        child: TabBar(
          tabs: const <Tab>[
            Tab(icon: Icon(Icons.shopping_cart), text: 'Shop'),
            Tab(icon: Icon(Icons.inventory), text: 'Inventory'),
          ],
          unselectedLabelColor: Colors.grey[600],
        ),
      ),
    );
  }
}
