import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const route = '/about';
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'About',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Thanks to : ❤😍  Prof./ SHERIF KESHK '),
          ),
          ListTile(
            title: Text('Made with ❤ by : Flutter Team '),
          ),
          ListTile(
            title: Text('Yasmina Salah'),
          ),
          ListTile(
            title: Text('Nesma Taher'),
          ),
          ListTile(
            title: Text('Ahmed abass'),
          ),
          ListTile(
            title: Text('Rola Hatem'),
          ),
          ListTile(
            title: Text('👨‍💻👩‍💻 Backend Team :'),
          ),
          ListTile(
            title: Text('Mohamed Anwar'),
          ),
          ListTile(
            title: Text('Walaa El-Genidy'),
          ),
          ListTile(
            title: Text('Rana Nagy'),
          ),
          ListTile(
            title: Text('👨‍💻👩‍💻Embedded systems Team :'),
          ),
          ListTile(
            title: Text('Ahmed Fathy'),
          ),
          ListTile(
            title: Text('Ahmed Magdy'),
          ),
          ListTile(
            title: Text('Aya Shoaib'),
          ),
        ],
      ),
    );
  }
}
