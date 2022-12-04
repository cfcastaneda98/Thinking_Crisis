import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thinking_crisis/Controller/GameScore.dart';
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
  @override
  void initState(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]
    );
  }
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
            "Please rotate to Portrait Mode",
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
  int currentScore = GameScore.currentPoints;
  int roundNumber = QuickPlay.roundAmount;
  double finalScore = (currentScore/roundNumber)*100;
  return Scaffold(
    backgroundColor: Colors.lightBlue[100],
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Game Result",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 70.0,
                fontFamily: 'Freestyle Script'
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Number correct:',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 50.0,
                fontFamily: 'Freestyle Script'
            ),
          ),
          Text(
            '${GameScore.currentPoints}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 60.0,
                fontFamily: 'Freestyle Script'
            ),
          ),
          Text(
            'Number Incorrect:',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 50.0,
                fontFamily: 'Freestyle Script'
            ),
          ),
          Text(
            '${GameScore.incorrectPoints}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 60.0,
                fontFamily: 'Freestyle Script'
            ),
          ),
          Text(
            'Total score:',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 50.0,
                fontFamily: 'Freestyle Script'
            ),
          ),
          Text(
            '${finalScore.round()}%',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 80.0,
                fontFamily: 'Freestyle Script'
            ),
          ),
          const SizedBox(height: 20),
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
