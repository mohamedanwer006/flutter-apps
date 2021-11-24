import 'package:flutter/material.dart';
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}
class _HomeState extends State<Home>{
final TextEditingController _orderControl=new TextEditingController();
  int radioGroup=0;
  String myOrder='';
  double orderPrice(String orderPrice ,delevPrice){
    if(orderPrice.isNotEmpty&& int.parse(orderPrice)>0){
      return int.parse(orderPrice)*delevPrice;
    }
    else{
      print('plese enter avaid price!');
      return int.parse(orderPrice)*1.0;
    }
  }


  void radioEventHandler(int value){
    setState(() {
      radioGroup = value;
      switch(radioGroup){
        case 0:
          orderPrice(_orderControl.text, 1200.0);
          break;
        case 1:
          orderPrice(_orderControl.text, 3200.0);
          break;
        case 2:
          orderPrice(_orderControl.text, 4000.0);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('orderapp'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(15)),
            Image.asset('img/profile.png',width: 150,height: 150,),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(22)),
                  Text(
                    'please make order',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'put number',
                      labelText: 'chose your order',
                      icon: Icon(Icons.add_circle)
                    ),
                    controller: _orderControl,
                    style: TextStyle(fontSize: 18),
                  ),

                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  RadioListTile(
                      value: 0,
                      groupValue: radioGroup,
                      onChanged: radioEventHandler,
                      title: Text('burger'),
                      subtitle: Text('55\$'),
                      activeColor: Colors.redAccent,
                  ),
                  RadioListTile(
                      value: 1,
                      groupValue: radioGroup,
                      onChanged: radioEventHandler,
                      title: Text('nodels'),
                      subtitle: Text('55\$'),
                      activeColor: Colors.redAccent,
                  ),
                  RadioListTile(
                      value: 2,
                      groupValue: radioGroup,
                      onChanged: radioEventHandler,
                      title: Text('pizza'),
                      subtitle: Text('55\$'),
                      activeColor: Colors.redAccent,
                  ),
                  Container(
                    child: Text('your order is$myOrder',style: TextStyle(
                      fontSize: 22,color: Colors.green
                    ),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}