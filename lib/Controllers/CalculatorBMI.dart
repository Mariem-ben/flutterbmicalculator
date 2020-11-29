import 'dart:math';

class Claculator {
   Claculator({this.height, this.weight });
  final int height;
  final int weight;
  double _bmi;

 

  String CalculteBMI(){
    _bmi=weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
String getResult(){
  if(_bmi>18.5){
    return('Normal');

  }else{
    return('underweight');
  }
}
String getinterpretation(){
  if(_bmi>=25){

    return('you have a heigher than normal body weight.Try to exercise more.');
  }
  else if(_bmi>18.5){
    return('you have a normal body weight. Good job!');
  }
else{
  return('you have a lower than  normal body weight. You can eat a bit more.');
}
}



}
