import 'package:flutter/material.dart';
import 'package:thinking_crisis/Controller/QuickPlay.dart';
import 'package:thinking_crisis/Model/PromptPool.dart';
import '../View/HomeScreen.dart';
import 'dart:math';
import 'package:thinking_crisis/Model/PromptPool.dart';

import 'GameScreen.dart';
class QuickplayResultScreen extends StatefulWidget {


  const QuickplayResultScreen({Key? key}) : super(key: key);

  @override
  State<QuickplayResultScreen> createState() => _QuickplayResultScreenState();
}

class _QuickplayResultScreenState extends State<QuickplayResultScreen> {
  int? _numQuestions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder:
          (context, orientation){
        if(orientation != Orientation.landscape)
        {
          return landscape(context);
        }//end if
        else{
          return potrait(context);
        }
      },
      ),
    );
  }
}
Widget potrait(BuildContext context)
{
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Please turn to Landscape mode",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 70.0,
                fontFamily: 'Freestyle Script'
            ),
          ),
        ],
      ),
    ),
  );
}
Widget landscape(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.lightBlue[100],
    body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Game Result",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 70.0,
                fontFamily: 'Freestyle Script'
            ),
          ),
          Text(
            'Number correct: ',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          Text(
            'Number Incorrect: ',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          Text(
            'Total score: ',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 80,
                width: 150,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.thumb_down_alt_sharp,
                    color: Colors.red,
                    size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 3.0, color: Colors.red),
                    elevation: 10,
                    backgroundColor: Colors.white,
                    minimumSize: const Size(100.0, 20.0),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  label: const Text(
                    "Exit",
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        fontFamily: 'Freestyle Script'
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                width: 170,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.thumb_up_off_alt_sharp,
                    color: Colors.green,
                    size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 3.0, color: Colors.green),
                    elevation: 10,
                    backgroundColor: Colors.white,
                    minimumSize: const Size(100.0, 20.0),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GameScreen()),
                    );
                  },
                  label: const Text(
                    "Restart",
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        fontFamily: 'Freestyle Script'
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
