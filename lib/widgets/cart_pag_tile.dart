// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class CartPagTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final color;
  final String ImagePath;
  void Function() onSlide;
  CartPagTile({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.ImagePath,
    required this.color,
    required this.onSlide,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.horizontal,
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          onSlide();
        } else if (direction == DismissDirection.endToStart) {
          onSlide();
        }
      },
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color[200],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            Image.asset(ImagePath, height: 70),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('\$ $itemPrice'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
