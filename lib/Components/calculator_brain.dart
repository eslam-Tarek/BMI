import 'dart:math';
class CalculatorBrain{
  CalculatorBrain(this.height, this.weight);
  final int height;
  final int weight;
  double _bmi;

  String CalculateBMI()
  {
    _bmi = weight / pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult()
  {
    if(_bmi >= 25)
      {
        return 'Overweigth';
      }else if(_bmi > 18.5)
      {
        return 'Normal';
      }else
        {
           return 'UnderWeigth';
        }
  }
  String getInterpretion()
  {
    if(_bmi >= 25)
    {
      return 'You have a hegther than normal body weigth.Try to exercise more.';
    }else if(_bmi > 18.5)
    {
      return 'You have a hegther normal body. Good job!';
    }else
    {
      return 'You have a lower than normal body. You can eat a bit more.';
    }
  }
}