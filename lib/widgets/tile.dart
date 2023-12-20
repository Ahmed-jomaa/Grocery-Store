// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final color;
  final String ImagePath;
  void Function()? onpressed;
  Tile(
      {Key? key,
      required this.itemName,
      required this.itemPrice,
      required this.ImagePath,
      required this.color,
      required this.onpressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, left: 8, right: 8),
      decoration: BoxDecoration(
        color: color[200],
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            ImagePath,
            height: 100,
          ),
          Text(
            itemName,
            style: TextStyle(fontSize: 18),
          ),
          MaterialButton(
            elevation: 0.0,
            onPressed: onpressed,
            color: color,
            child: Text(
              '\$ $itemPrice',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
