import 'package:flutter/material.dart';
import 'package:flutterbmicalculator/screens/ResultScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/IconTextFile.dart';
import '../utils/RepeatContainer.dart';
import '../Controllers/CalculatorBMI.dart';

const activeColor=Color(0xFF1D1E33);

const deActiveColor=Color(0xFF111328);

enum Gender{
  male,
female
}

class InputPage extends StatefulWidget {
   
  @override
  _InputPage createState() => _InputPage();
}

class _InputPage extends State<InputPage> {

  Gender selectedGender;
  int sliderHeight=180;
  int sliderweight=60;
  int sliderAge=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMICALCULATOR'),
      ),
      body:Column(children: [
        Expanded(child:Row(children: [
            Expanded(
              child:GestureDetector(
                onTap:() {
                  setState(() {
                 selectedGender=Gender.male;
                  });
                },
                
                              child:  RepeatContainer(
                                onPresed: (){
                                  setState(() {
                                    selectedGender=Gender.male;
                                  });
                                },
                  Colors: selectedGender==Gender.male?activeColor:deActiveColor,
                  cardWidget: RepeattextandIconswidgets(
                    iconData: FontAwesomeIcons.mars,
                    label: 'Male',
                  ),
                
                    
                  ),
              ),
        ),
            

            Expanded(child:GestureDetector(
               onTap:() {
                  setState(() {
                   selectedGender=Gender.female;
                  });
                },
                child: RepeatContainer(
                    onPresed: (){
                                  setState(() {
                                    selectedGender=Gender.female;
                                  });
                                },

                  Colors:selectedGender==Gender.female?activeColor:deActiveColor,
              cardWidget: RepeattextandIconswidgets(
                  iconData: FontAwesomeIcons.venus,
                    label: 'Female',
              ),
        ),
            ),
              ),

        ],
        ),
        ),

        Expanded(child:new RepeatContainer(Colors: Color(0xFF1D1E33),
        cardWidget:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('HEIGHT',style: TextStyle(fontSize: 30.0,color: Color(0xFF8D8E98)),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(sliderHeight.toString(),style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.w900),),
            Text('cm',style: TextStyle(fontSize: 30.0,color: Color(0xFF8D8E98)),),
            

          ],),
          Slider(
              value: sliderHeight.toDouble(),
              min:120.0 ,
              max: 220.0,
              activeColor: Color(0xFFEB1555),
              inactiveColor: Color(0xFF8D8E98),
              onChanged: (double newValue){
                setState(() {
                  sliderHeight=newValue.round();
                });
              },
         
            ),
        ],),
    
        ),        ),

       Expanded(child:Row(children: [
            Expanded(child:new RepeatContainer(
              Colors: Color(0xFF1D1E33),
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('WEIGHT',
                style: TextStyle(fontSize: 30.0,color: Color(0xFF8D8E98)),
                ),
                Text(sliderweight.toString(),
                style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.w900)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundIcon(
                      iconData:FontAwesomeIcons.minus,
                     onPress: (){
                       setState(() {
                         sliderweight--;
                       });
                     },

                    ),
                    SizedBox(width:10.0),
                    RoundIcon(
                      iconData:FontAwesomeIcons.plus,
                     onPress: (){
                       setState(() {
                         sliderweight++;
                       });
                     },

                    ),

                

                ],)
              ],),
        
        )),
            Expanded(child:new RepeatContainer(Colors: Color(0xFF1D1E33),
             cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('AGE',
                style: TextStyle(fontSize: 30.0,color: Color(0xFF8D8E98)),
                ),
                Text(sliderAge.toString(),
                style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.w900)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundIcon(
                      iconData:FontAwesomeIcons.minus,
                     onPress: (){
                       setState(() {
                         sliderAge--;
                       });
                     },

                    ),
                    SizedBox(width:10.0),
                    RoundIcon(
                      iconData:FontAwesomeIcons.plus,
                     onPress: (){
                       setState(() {
                         sliderAge++;
                       });
                     },

                    ),

                

                ],)
              ],),
       
        )
        ),
      
        ],
        ),
        ),
           GestureDetector(
             onTap: (){
              Claculator calculbmi=Claculator(height:sliderHeight, weight:sliderweight);
               Navigator.push(context, MaterialPageRoute(builder:(context)=>ResultScreen(
                 bmiResult: calculbmi.CalculteBMI(),
                 resultText: calculbmi.getResult(),
                 resultinterpretation: calculbmi.getinterpretation(),
               )));
             },
                        child: Container(
          child: Center(child: Text('Calculate',style: TextStyle(fontSize: 25.0 ,fontWeight: FontWeight.bold),)),
               color: Color(0xFFEB1555),
               margin: EdgeInsets.only(top: 10.0),
               width: double.infinity,
               height: 80,
             ),
           ),

      ],)
      

    );
  }
}
class RoundIcon extends StatelessWidget {
  RoundIcon({@required this.iconData, this.onPress});
  final IconData iconData;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width:56.0,
        height:56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),

    );
  }
}


