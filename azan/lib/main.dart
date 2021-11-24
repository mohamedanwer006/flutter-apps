// https://api.aladhan.com/v1/calendarByAddress?address=cairo&method=5
// http://api.aladhan.com/v1/timingsByAddress?address=cairo
import 'package:azan/models/aladhan.dart';
import 'package:azan/services/api_services.dart';
import 'package:azan/utils/utlis.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var services = Services();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = Utils.getWidth(context);
    double height = Utils.getHeight(context);
    return Scaffold(
      body: FutureBuilder<Aladhan?>(
          future: services.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Aladhan? _aladhan = snapshot.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: width,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.red,
                          padding: EdgeInsets.zero,
                          child: SizedBox(
                            height: 35,
                            width: 35,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Icon(Icons.menu),
                            ),
                          ),
                        ),
                        const Text('data'),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.45,
                    color: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Center(
                        child: Text(Utils.formatTime(_aladhan!
                            .data![DateTime.now().day].timings!.fajr!)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // height: height * 0.4,
                      // width: width,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: GridView.builder(
                          itemCount: 4,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            // childAspectRatio: 1,
                            mainAxisExtent: 160.0,
                            // crossAxisSpacing: 1,
                            // mainAxisSpacing: 0,
                          ),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(35)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.3,
                    color: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(35)),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }
          }),
    );
  }
}
