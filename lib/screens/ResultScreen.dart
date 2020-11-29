import 'package:flutter/material.dart';
import 'package:flutterbmicalculator/screens/InputPage.dart';
import 'package:flutterbmicalculator/utils/RepeatContainer.dart';

class ResultScreen extends StatelessWidget {
ResultScreen({@required this.bmiResult, @required this.resultText,@required this.resultinterpretation});
  final String bmiResult;
  final String resultText;
  final String resultinterpretation;
  @override
  Widget build(BuildContext context) {
    var text = Text(resultText.toUpperCase(),textAlign:TextAlign.center,
                );
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Expanded(
          child: Container(child: Center(child: Text('your Result',style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),)),),
          ),
        
        Expanded(
          flex: 5,
          child: RepeatContainer(Colors: activeColor,
          cardWidget:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                    Text(resultText,style: TextStyle(fontSize: 30.0),textAlign:TextAlign.center,),
                   Text(bmiResult,style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold,),textAlign:TextAlign.center),
                  Text(resultinterpretation,textAlign:TextAlign.center,),
                 

          ],)),
          
        ),
        Expanded(child: GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder:(context)=>InputPage()));
             },
                        child: Container(
          child: Center(child: Text('Recalculate',style: TextStyle(fontSize: 25.0 ,fontWeight: FontWeight.bold),)),
               color: Color(0xFFEB1555),
               margin: EdgeInsets.only(top: 10.0),
               width: double.infinity,
               height: 80,
             ),
           ),

        ),
      ],

      )
    );

  }
}