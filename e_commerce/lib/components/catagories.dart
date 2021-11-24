import 'package:flutter/material.dart';

class CatagorieListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Catagorie(image: 'assets/images/cats/tshirt.png',title: 'shirt',),
          Catagorie(image: 'assets/images/cats/dress.png', title: 'dress',),
          Catagorie(image: 'assets/images/cats/formal.png',title: 'formal',),
          Catagorie(image: 'assets/images/cats/informal.png',title: 'informal',),
          Catagorie(image: 'assets/images/cats/jeans.png',title: 'jeans',),
          Catagorie(image: 'assets/images/cats/shoe.png',title: 'shoe',),
          Catagorie(image: 'assets/images/cats/accessories.png',title: 'accessories',),
        ],
      ),
    );
  }
}

class Catagorie extends StatelessWidget {
  final String title;
  final String image;

  const Catagorie({Key key, this.title, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
          width: 100,
          height: 65,
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {},
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Image.asset(image,height: 40,color: Colors.black,),
              subtitle: Align(
                alignment: Alignment.topCenter,
                child: Text(title),
              ),
            ),
          )),
    );
  }
}
