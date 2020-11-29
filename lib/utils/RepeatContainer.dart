import 'package:flutter/material.dart';

class RepeatContainer extends StatelessWidget {
  RepeatContainer({@required this.Colors, this.cardWidget, this.onPresed});
  final Color Colors;
  final Widget cardWidget;
  final Function onPresed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPresed,
          child: Container(
        
                  margin:   EdgeInsets.all(15.0),
                  child: cardWidget,
                  decoration: BoxDecoration(color: Colors,
                  borderRadius: BorderRadius.circular(10.0)),
      ),
    );

  }
}
