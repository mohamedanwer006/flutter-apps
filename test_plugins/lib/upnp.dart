// import 'dart:convert';
// import "package:upnp/upnp.dart" as upnp;
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Home(),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   late upnp.DeviceDiscoverer deviceDiscoverer;

//   initUpnp() async {
//     deviceDiscoverer = upnp.DeviceDiscoverer();
//     await deviceDiscoverer.start();
//   }

//   @override
//   void initState() {
//     initUpnp();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: FutureBuilder<List<upnp.Device>>(
//           future: listConnectedDevices(),
//           builder: (context, AsyncSnapshot<List<upnp.Device>> snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               if (snapshot.hasData) {
//                 List<upnp.Device> devList = snapshot.data!;
//                 return ListView.builder(
//                   itemCount: devList.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         color: Colors.lightBlueAccent,
//                         child: ListTile(
//                           title: Text(devList[index].friendlyName),
//                           subtitle: Text(devList[index].url),
//                           leading: Image.network(
//                               "https://i.pinimg.com/originals/ab/04/1f/ab041f3df106bcfd45d230da8111ca52.png"),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               } else {
//                 return const Center(
//                   child: Text('There is no devices connected to network'),
//                 );
//               }
//             } else {
//               return const Center(
//                 child: Text('please wait...'),
//               );
//             }
//           }),
//       floatingActionButton: FloatingActionButton(
//           onPressed: requestPairingKey, child: const Text('scan')),
//     );
//   }

// // Show pairing key on the TV screen
//   requestPairingKey() async {
//     // var port = 8080;
//     String address = 'http://192.168.1.3:';
//   }

//   Future<List<upnp.Device>> listConnectedDevices() async {
//     // deviceDiscoverer.quickDiscoverClients().listen((client) async {
//     //   try {
//     //     var dev = await client.getDevice();
//     //     print("${dev.friendlyName}: ${dev.url}");
//     //     // print("${dev.deviceType}: ${dev.presentationUrl}");
//     //   } catch (e, stack) {
//     //     print("ERROR: $e - ${client.location}");
//     //     print(stack);
//     //   }
//     // });
//     var devs = await deviceDiscoverer.getDevices();
//     return devs;
//   }
// }
