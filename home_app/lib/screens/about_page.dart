import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const route = '/about';
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('About',style: Theme.of(context).textTheme.headline3,),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Made with ❤ by : Flutter team'),
          ),
          ListTile(
            title: Text('Mohamed \nYasmina \nFathy \nNesma \nMagdy \nAbass '),
          ),
        ],
      ),
    );
  }
}
