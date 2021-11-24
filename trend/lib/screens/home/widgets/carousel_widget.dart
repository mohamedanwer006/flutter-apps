import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trend/services/database/db_services.dart';

List<String> list = [
  'https://www.rollingstone.com/wp-content/uploads/2019/07/10216462ls.jpg?crop=900:600&width=440',
  'https://www.harpersbazaararabia.com/public/images/2020/02/23/Yasmine-Sabri-x-Cartier.jpg',
  'https://static.independent.co.uk/s3fs-public/thumbnails/image/2015/11/11/09/Scarlett-Johansson-Black-Widow.jpg',
  'https://www.enigma-mag.com/wp-content/uploads/2018/12/after-party-82.jpg',
  'https://scstylecaster.files.wordpress.com/2019/04/scarlett-johannson-avengers-endgame-1.jpg',
  'https://www.aljoumhouria.com/glide/News/archive/410/409304_untitled-20.jpg',
  'https://i.huffpost.com/gen/2641192/images/o-SCARLETT-JOHANSSON-facebook.jpg',
  'https://www.almuheet.net/wp-content/uploads/2019/10/من-هو-زوج-كارمن-بصيبص.jpg',
  'https://walterschupfer.s3.amazonaws.com/gxxl_51b0a2bc-f5b8-4e66-8d77-330c0aa613db.jpg',
  'https://i-exc.ccm2.net/iex/1280/1383769826/1382414.jpg',
  'https://www.foochia.com/wp-content/uploads/2019/09/5791131-334956670.jpg'
];

class CarouselWidget extends StatefulWidget {
  CarouselWidget({Key key}) : super(key: key);

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      list.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DbServices>(
      builder: (context, value, child) => CarouselSlider.builder(
        itemCount: value.trendData.carouselImages.length,
        itemBuilder: (context, index) => Container(
          height: MediaQuery.of(context).size.height * 0.35,
          // width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: NetworkImage(
                value.trendData.carouselImages[index].imgUrl,
                scale: 1,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        options: CarouselOptions(
          autoPlay: true,
          autoPlayAnimationDuration: Duration(seconds: 2),
          autoPlayInterval: Duration(seconds: 3),
          autoPlayCurve: Curves.linear,
          initialPage: (7 / 2).floor(),
          height: MediaQuery.of(context).size.height * 0.35,
          aspectRatio: 16 / 9,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
