import 'package:flutter/material.dart';

const labelStyle =  TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));

class IconContent extends StatelessWidget
{
  final IconData iconn;
  final String title;
  IconContent( this.iconn, this.title);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconn ,size:80.0,),
        SizedBox(height: 15.0,),
        Text(title,  style:labelStyle),
      ],
    );
  }
}
