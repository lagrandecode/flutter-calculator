import 'package:flutter/material.dart';
import 'button.dart';
import 'button.dart';
import 'dart:math';
import 'package:math_expressions/math_expressions.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var Questions = '';
  var Answers = '';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 30.0,),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(Questions, style: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(Answers, style: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return MyButton(
                          tapped: (){
                            setState(() {
                              Questions = '';
                              Answers = '';
                            });
                          },
                          buttontext: buttons[index],
                          backgroundcolor: Colors.green,
                          textcolor: Colors.white,
                        );
                      } else if (index == 1) {
                        return MyButton(
                          tapped: (){
                            setState(() {
                              Questions = Questions.substring(0, Questions.length-1);
                            });
                          },
                          buttontext: buttons[index],
                          backgroundcolor: Colors.red,
                          textcolor: Colors.white,
                        );

                        // this is the equal button for calculating variables



                      } else if (index == buttons.length-1) {
                        return MyButton(
                          tapped: (){
                            setState(() {
                              equalCalculate();
                            });
                          },
                          buttontext: buttons[index],
                          backgroundcolor: Colors.deepPurple,
                          textcolor: Colors.white,
                        );

                      } else if (index == 7) {
                        return MyButton(
                          tapped: (){
                            setState(() {
                              Questions +=  '*';
                            });
                          },
                          buttontext: buttons[index],
                          backgroundcolor: Colors.deepPurple,
                          textcolor: Colors.white,
                        );

                        //answer button

                      } else if (index == buttons.length-2) {
                        return MyButton(
                          tapped: (){
                            setState(() {
                              Questions =  Answers;
                            });
                          },
                          buttontext: buttons[index],
                          backgroundcolor: Colors.white,
                          textcolor: Colors.deepPurple,
                        );

                        //this are the numbers except c, del

                      } else
                        return MyButton(
                          tapped: (){
                            setState(() {
                              Questions += buttons[index];
                            });
                          },
                          buttontext: buttons[index],
                          backgroundcolor: isButton(buttons[index])
                              ? Colors.deepPurple
                              : Colors.white,
                          textcolor: isButton(buttons[index])
                              ? Colors.white
                              : Colors.deepPurple,
                        );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isButton(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  void equalCalculate(){
    String finalQuestion = Questions;


    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    Answers = eval.toString();

    //this is the math behind the result


  }
}
