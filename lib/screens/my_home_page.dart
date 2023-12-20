import 'package:flutter/material.dart';
import 'package:grocery_store/model/cart_model.dart';
import 'package:grocery_store/screens/cart_pag.dart';
import 'package:grocery_store/widgets/tile.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('Good Morning'),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Let\'s order fresh items for you',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Divider(),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Fresh Items',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  itemCount: value.shopitems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                  itemBuilder: (context, index) {
                    return Tile(
                      itemName: value.shopitems[index][0],
                      itemPrice: value.shopitems[index][1],
                      color: value.shopitems[index][3],
                      ImagePath: value.shopitems[index][2],
                      onpressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CartPag();
          }));
        },
        child: Icon(Icons.storefront_rounded),
      ),
    );
  }
}
