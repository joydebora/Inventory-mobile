import 'package:flutter/material.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/screens/inventory_detail.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemDetail(item: item)));
        },
      ),
    );
  }
}