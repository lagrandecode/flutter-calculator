import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final tapped;

  final backgroundcolor;
  final textcolor;
  final String buttontext;
  MyButton({this.textcolor, this.buttontext, this.backgroundcolor, this.tapped});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: tapped,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: backgroundcolor,
            child: Center(child: Text(buttontext, style: TextStyle(color: textcolor, fontSize: 20.0, fontStyle: FontStyle.italic),),),
          ),


        ),
      ),
    );
  }
}
