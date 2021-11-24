import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();

TextStyle textStyle=TextStyle(
  fontSize: 22
);
TextStyle titleStyle=TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  letterSpacing: 4,
  color: Colors.red
);

  String result = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('ograty'.toUpperCase(),style: titleStyle),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            tooltip: 'more',
            iconSize: 25,
          )
        ],
      ),
      body: Container(
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                          child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                firstHeader(),
                SizedBox(height: 5,),
                secondHeader(),
                SizedBox(height: 18,),
                Container(
                  child: Text('From',style: titleStyle,),
                ),
                thirdHeader(),
                SizedBox(height: 6,),
              ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 80,
          color: Colors.orange,
          child: widgetResult(result),
        ),
        Container(
          width: 120,
          child: RaisedButton(
              color: Colors.green[400],
              onPressed: calculate,
              child: Text('=',style: textStyle,),
          ),
        ),
      ],
              ),
            )),
    );
  }

  Widget firstHeader() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text('Enter',style: textStyle,),
        ),
        // SizedBox(width: 120,),
        Container(
          width: MediaQuery.of(context).size.width*0.6,
          child: TextField(
            autofocus: true,
            style: textStyle,
            controller: firstController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Elogra',
              suffixIcon: Icon(Icons.attach_money)
            ),
          ),
        ),
      ],
    );
  }

 Widget secondHeader() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text('Enter',style: textStyle,),
        ),
        // SizedBox(width: 120,),
        Container(
          width: MediaQuery.of(context).size.width*0.6,
          child: TextField(
            style: textStyle,
            controller: secondController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'number of pepole',
              suffixIcon: Icon(Icons.person)
            ),
          ),
        ),
      ],
    );
  }
   Widget thirdHeader() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text('Enter',style: textStyle,),
        ),
        // SizedBox(width: 120,),
        Container(
          width: MediaQuery.of(context).size.width*0.6,
          child: TextField(
            style: textStyle,
            controller: thirdController,
            keyboardType: TextInputType.number, 

            decoration: InputDecoration(
              hintText: 'amount',
              suffixIcon: Icon(Icons.attach_money)
            ),
          ),
        ),
      ],
    );
  }

  Widget widgetResult(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[Text('El baki',style: textStyle,), Text(':',style: textStyle,), Text(text,style: textStyle,)],
    );
  }
  calculate() {
    var ogra = double.parse(firstController.text);
    var number = double.parse(secondController.text);
    var amount = double.parse(thirdController.text);
    var sum = amount - (ogra * number);
    setState(() {
      result = sum.toString();
    });
  }
}
