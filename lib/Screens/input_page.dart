import 'package:bmi/Components/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/icon_content.dart';
import '../Components/resubale_carde.dart';
import '../Components/calculator_brain.dart';

const buttomContianerHeigth = 60.0;
const ActiveColor = Color(0xFF1D1E33);
const InActiveColor = Color(0xFF111328);
const bottomContianercolor = Color(0xFFEB1555);
const NumberStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);
enum Gender{male,female}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 21;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children: <Widget>[
            // For Male
            Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(colour: selectedGender == Gender.male ? ActiveColor : InActiveColor,
                        onPress: (){
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        cardChild: IconContent(FontAwesomeIcons.mars,'MALE'),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(colour : selectedGender == Gender.female ? ActiveColor : InActiveColor,
                        onPress: (){
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        cardChild: IconContent(FontAwesomeIcons.venus, 'FMALE'),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: ReusableCard(colour:InActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT',style:labelStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                            height.toString(),
                            style:NumberStyle),
                        Text('cm',style: labelStyle)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTickMarkColor: Color(0xFF8D8E98),
                        overlayColor: Color(0x29EB1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(colour:InActiveColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('WEIGHT', style: labelStyle),
                            Text(weight.toString(),style: NumberStyle,),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(icon: FontAwesomeIcons.minus,
                                    action: ()
                                    {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10.0,),
                                  RoundIconButton(icon: FontAwesomeIcons.plus,
                                    action: (){
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(colour:InActiveColor,
                        cardChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('AGE', style: labelStyle),
                            Text(age.toString(),style: NumberStyle,),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(icon: FontAwesomeIcons.minus,
                                    action: ()
                                    {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10.0,),
                                  RoundIconButton(icon: FontAwesomeIcons.plus,
                                    action:(){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            GestureDetector(
              onTap: ()
              {
                CalculatorBrain calc = CalculatorBrain(height,weight );

                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                  bmiResult: calc.CalculateBMI(),
                  reusultText: calc.getResult(),
                  interpertion: calc.getInterpretion(),
                )),);
              },
              child: Center(
                child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top:14.0),
                      child: Text('CALCULATE',
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
          ]),
    );
  }
}

class RoundIconButton extends StatelessWidget
{
  RoundIconButton({@required this.icon,@required this.action});
  final IconData icon;
  final Function action;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: action,
      elevation: 6.0,
      disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape:CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child:Icon(icon),
    );
  }
}