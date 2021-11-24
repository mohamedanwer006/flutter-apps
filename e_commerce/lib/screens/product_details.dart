import 'package:e_commerce/components/products.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String name;
  final String picture;
  final int oldPrice;
  final int currentPrice;

  const ProductDetails(
      {Key key, this.name, this.picture, this.oldPrice, this.currentPrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
        elevation: 0,
        title: Text("details"),
      ),
      body: ListView(
        children: [
          Container(
            height: 360,
            child: GridTile(
              child: Image.asset(
                picture,
                fit: BoxFit.cover,
              ),
              footer: Material(
                color: Colors.transparent,
                child: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      '$name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    title: Row(
                      children: [
                        Expanded(
                            child: Text(
                          '$oldPrice',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.lineThrough),
                        )),
                        Expanded(
                            child: Text(
                          '$currentPrice',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w800),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('size'),
                      content: Text('choose size'),
                      actions: [
                        MaterialButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('close'),
                        )
                      ],
                    ),
                  );
                },
                child: Row(
                  children: [
                    Expanded(child: Text('size')),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('color'),
                      content: Text('choose color'),
                      actions: [
                        MaterialButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('close'),
                        )
                      ],
                    ),
                  );
                },
                child: Row(
                  children: [
                    Expanded(child: Text('color')),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              )),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('quantity'),
                        content: Text('choose quantity'),
                        actions: [
                          MaterialButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('close'),
                          )
                        ],
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Expanded(child: Text('Qty')),
                      Expanded(child: Icon(Icons.arrow_drop_down))
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  elevation: 0,
                  color: Colors.blueGrey,
                  onPressed: () {},
                  child: Text(
                    'Buy now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart, color: Colors.red),
                onPressed: () {},
              ),
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Product details'),
            subtitle: Text(
                'Since 1986, Airwalk has been one of the brands that launched and built the action sports community. They are fueled by passion and progression, driven by people pushing innovation, supporting the scene, and taking risks.'),
          ),
          Divider(),

          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Product name',
                    style: TextStyle(color: Colors.grey),
                  ),),
                  Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '$name',
                    style: TextStyle(color: Colors.black),
                  ),), 
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Product brand',
                    style: TextStyle(color: Colors.grey),
                  )),
                   Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'zara',
                    style: TextStyle(color: Colors.black),
                  ),),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Product condition',
                    style: TextStyle(color: Colors.grey),
                  )),
                   Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'new',
                    style: TextStyle(color: Colors.black),
                  ),),
            ],
          ),
          Divider(),
          Container(
            height: 350,
            child: SimilarProducts()
            ),

        ],
      ),
    );
  }
}



class SimilarProducts extends StatefulWidget {
  SimilarProducts({Key key}) : super(key: key);

  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {

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
