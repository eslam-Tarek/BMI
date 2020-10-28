import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'dart:async';

class StratPage extends StatefulWidget {
  @override
  _StratPageState createState() => _StratPageState();
}

class _StratPageState extends State<StratPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  startTimer() async{
    var duration = Duration(seconds: 5);
    return Timer(duration , route);
  }
  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder:(context) => InputPage(),
      ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset('images/bm.jpg',),
            ),
            Padding(padding: EdgeInsets.only(top:40.0),
            ),
            Text('BMI Calucator',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 40.0),),
           Padding(padding: EdgeInsets.only(top:40.0),),
            CircularProgressIndicator(
              backgroundColor: Colors.black,
              strokeWidth: 4,
            ),
          ],
        ),
      ),
    );
  }
}
