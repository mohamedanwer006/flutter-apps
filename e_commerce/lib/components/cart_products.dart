import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  CartProducts({Key key}) : super(key: key);

  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  List productsInCart = [
    {
      "name": "Blazer1",
      "picture": "assets/images/products/blazer1.jpeg",
      "price": 85,
      "color": 'red',
      "size": 'M',
      "quantity": 2
    },
    {
      "name": "Blazer2",
      "picture": "assets/images/products/blazer2.jpeg",
      "price": 85,
      "color": 'blue',
      "size": 'M',
      "quantity": 1
    },
     {
      "name": "Blazer2",
      "picture": "assets/images/products/dress2.jpeg",
      "price": 85,
      "color": 'black',
      "size": 'L',
      "quantity": 1
    },
     {
      "name": "Blazer2",
      "picture": "assets/images/products/pants2.jpeg",
      "price": 85,
      "color": 'grey',
      "size": 'L',
      "quantity": 1
    },
    // {
    //   "name": "dress2",
    //   "picture": "assets/images/products/dress2.jpeg",
    //   "old_price": 100,
    //   "price": 50,
    // },
    //  {
    //   "name": "panst2",
    //   "picture": "assets/images/products/pants2.jpeg",
    //   "old_price": 100,
    //   "price": 50,
    // },
    //  {
    //   "name": "skt1",
    //   "picture": "assets/images/products/skt1.jpeg",
    //   "old_price": 100,
    //   "price": 50,
    // },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productsInCart.length,
      itemBuilder: (context, index) {
        return CartProduct(
          name: productsInCart[index]['name'],
          color: productsInCart[index]['color'],
          picture: productsInCart[index]['picture'],
          price: productsInCart[index]['price'],
          quantity: productsInCart[index]['quantity'],
          size: productsInCart[index]['size'],
        );
      },
    );
  }
}

class CartProduct extends StatelessWidget {
  final String name;
  final String picture;
  final int price;
  final String size;
  final String color;
  final int quantity;
  const CartProduct({
    Key key,
    this.name,
    this.picture,
    this.price,
    this.size,
    this.color,
    this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          picture,
        ),
        title: Text('$name'),
        subtitle: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text('Size :'),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    '$size',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text('Color :'),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    '$color',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    '\$$price',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
        trailing: Column(
          children: [
            Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    width: 45,
                    child: MaterialButton(
                        child: Icon(
                          Icons.arrow_drop_up,
                        ),
                        onPressed: () {}))),
            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    width: 45,
                    child: Text('$quantity'))),
            Expanded(
                child: Container(
                    width: 45,
                    child: MaterialButton(
                        child: Icon(
                          Icons.arrow_drop_down,
                        ),
                        onPressed: () {}))),
          ],
        ),
        // isThreeLine: true,
      ),
    );
  }
}
