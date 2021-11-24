import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

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
        
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
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
                    SizedBox(height: 10,),
                    secondHeader(),
                    SizedBox(height: 10,),
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
            style: textStyle,
            autofocus: true,
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
  Widget widgetResult(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[Text('Total',style: textStyle,), Text(':',style: textStyle,), Text(text,style: textStyle,)],
    );
  }
  calculate() {
    var ogra = double.parse(firstController.text);
    var number = double.parse(secondController.text);
    var sum = ogra * number;
    setState(() {
      result = sum.toString();
    });
  }
}
