import 'package:e_commerce/components/cart_products.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: () {}),
          // IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
        elevation: 0,
        centerTitle: true,
        title: Text("My Cart" ,style: TextStyle(color: Colors.black),),
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text('Total : '),
                subtitle: Text('\$255'),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                color: Colors.blueGrey,
                child: Text(
                  'Chech out',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: CartProducts(),
    );
  }
}
