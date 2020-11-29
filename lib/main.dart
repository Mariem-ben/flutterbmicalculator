import 'package:flutter/material.dart';
import 'package:flutterbmicalculator/screens/InputPage.dart';

void main() {
  runApp(BMICaluclator());
}


class BMICaluclator extends StatelessWidget {
  const BMICaluclator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21)),
    
     );

    
  }
}



