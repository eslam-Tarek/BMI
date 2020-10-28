import 'package:bmi/Screens/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'resubale_carde.dart';
class ResultPage extends StatelessWidget
{
  ResultPage({@required this.bmiResult,@required this.reusultText,@required this.interpertion});

  final String bmiResult;
  final String reusultText;
  final String interpertion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child:ReusableCard(colour: ActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(//2
                     reusultText.toUpperCase(),
                    style: TextStyle(color: Color(0xFF24DA76),fontSize: 22.0,),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text( // 3
                    interpertion,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ) ,
          ),
          GestureDetector(
            onTap: ()
            {
              Navigator.pop(context);
            },
            child: Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top:14.0),
                  child: Text('RE-CALCULATE',
                    style:TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                color: bottomContianercolor,
                margin: EdgeInsets.only(top:10.0),
                width: double.infinity,
                height: buttomContianerHeigth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}