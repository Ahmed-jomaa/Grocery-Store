import 'package:flutter/material.dart';
import 'package:grocery_store/model/cart_model.dart';
import 'package:grocery_store/widgets/cart_pag_tile.dart';
import 'package:provider/provider.dart';

class CartPag extends StatefulWidget {
  const CartPag({super.key});

  @override
  State<CartPag> createState() => _CartPagState();
}

class _CartPagState extends State<CartPag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          if (value.cartItems.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartPagTile(
                        itemName: value.cartItems[index][0],
                        itemPrice: value.cartItems[index][1],
                        ImagePath: value.cartItems[index][2],
                        color: value.cartItems[index][3],
                        onSlide: () {
                          Provider.of<CartModel>(context, listen: false)
                              .removeItemFromCart(index);
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                    //margin: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.purple[300],
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.black, width: 1.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your total price is: ${value.calculateTotalPrice()}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text('Press to pay')
                          ],
                        ),
                        Text(
                          '\$',
                          style: TextStyle(fontSize: 32),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          } else {
            return Center(child: Text('Your cart is empty'));
          }
        },
      ),
    );
  }
}
