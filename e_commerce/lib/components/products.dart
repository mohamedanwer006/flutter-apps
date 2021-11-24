import 'package:e_commerce/screens/product_details.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  Products({Key key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List products = [
    {
      "name": "Blazer1",
      "picture": "assets/images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "assets/images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Blazer2",
      "picture": "assets/images/products/blazer2.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "dress2",
      "picture": "assets/images/products/dress2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "hills1",
      "picture": "assets/images/products/hills1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "hills2",
      "picture": "assets/images/products/hills2.jpeg",
      "old_price": 100,
      "price": 50,
    },
     {
      "name": "panst2",
      "picture": "assets/images/products/pants2.jpeg",
      "old_price": 100,
      "price": 50,
    },
     {
      "name": "skt1",
      "picture": "assets/images/products/skt1.jpeg",
      "old_price": 100,
      "price": 50,
    },
     {
      "name": "skt2",
      "picture": "assets/images/products/skt2.jpeg",
      "old_price": 100,
      "price": 50,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Product(
            name: products[index]['name'],
            picture: products[index]['picture'],
            oldPrice: products[index]['old_price'],
            currentPrice: products[index]['price'],
          ),
        );
      },
    );
  }
}

class Product extends StatelessWidget {
  final String name;
  final String picture;
  final int oldPrice;
  final int currentPrice;

  const Product(
      {Key key, this.name, this.picture, this.oldPrice, this.currentPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetails(
                            currentPrice: currentPrice,
                            oldPrice: oldPrice,
                            name: name,
                            picture: picture,
                          ))),
              child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      '$name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      '$currentPrice',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      '$oldPrice',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ),
                ),
                child: Image.asset(
                  picture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
    );
  }
}
