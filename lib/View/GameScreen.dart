// Author: Carlos Castaneda, Isaac Campos
// Class: CS 4381
// Date modified: 12/4/22
// Instructor: Yoonsik Cheon
// Assignment: Thinking Crisis (Semester Project) (10 of 16)
// Purpose: Practice our skills to create our very own application
// which in this case is a guessing party game that uses only one phone.
// Implements the logic for the game screen
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thinking_crisis/Controller/GameScore.dart';
import 'package:thinking_crisis/Controller/QuickPlay.dart';
import 'package:thinking_crisis/Model/PromptPool.dart';
import 'package:thinking_crisis/View/QuickplayOptionsScreen.dart';
import 'package:thinking_crisis/View/QuickplayResultScreen.dart';
import '../View/HomeScreen.dart';
import 'dart:math';
import 'package:thinking_crisis/Model/PromptPool.dart';
///Will display the realtime gameplay of a certain mode
class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);
  @override
  State<GameScreen> createState() => _GameScreenState();
}
class _GameScreenState extends State<GameScreen> {
  int promptIndex = 0;
  var newList;
  Timer? countdownTimer;
  final PromptPool promptP = new PromptPool();
  var num = Random();
  int gameIndex = QuickPlay.roundAmount;
  Duration roundDuration = Duration(seconds: QuickPlay.roundTime);
  ///Will start the round timer
  void startTimer(){
    countdownTimer = Timer.periodic(Duration(seconds: 1),(_) => setCountdown());
  }
  ///Will stop the round timer
  void stopTimer(){
    setState(() => countdownTimer!.cancel());
  }
  ///Will reset the round timer
  void resetTimer(){
    stopTimer();
    setState(() => roundDuration = Duration(seconds: QuickPlay.roundTime));
  }
  ///Will decrease the timer by increments of one until it reaches to zero
  void setCountdown(){
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = roundDuration.inSeconds - reduceSecondsBy;
      if(seconds < 0){
        countdownTimer!.cancel();
        GameScore.incorrectPoints++;
      } else{
        roundDuration = Duration(seconds: seconds);
      }
    });
  }
  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]
    );
    GameScore.currentPoints = 0;
    GameScore.incorrectPoints = 0;
    startTimer();
    setNewPrompts();
  }
  ///Sets the new random prompts that will be used throughout the game session
  void setNewPrompts(){
    newList = promptP.selectRandomPrompts(QuickPlay.roundAmount+1);
  }
  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = strDigits(roundDuration.inSeconds.remainder(130));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app_sharp),
          iconSize: 50,
          color: Colors.black,
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.pause_circle_outline_sharp),
            iconSize: 50,
            color: Colors.black,
            onPressed: () {
              stopTimer();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              //promptP.quickPlayList[promptIndex],
              newList[promptIndex],
              style: const TextStyle(
                  letterSpacing: 5.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 100.0,
                  fontFamily: 'Freestyle Script'
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          seconds,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 60.0,
                              fontFamily: 'Freestyle Script'
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.height * 0.82,
                  child: TextButton.icon(
                    icon: const Icon(
                      Icons.tag_faces_outlined,
                      color: Colors.green,
                      size: 70,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      promptIndex++;
                      gameIndex--;
                      GameScore.currentPoints++;
                      resetTimer();
                      startTimer();
                      if(gameIndex == 0){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QuickplayResultScreen()),
                        );
                      };
                    },
                    label: const Text(
                      'Passed',
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          fontFamily: 'Freestyle Script'
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.height * 0.82,
                  child: TextButton.icon(
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                      size: 70,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      promptIndex++;
                      gameIndex--;
                      GameScore.incorrectPoints++;
                      resetTimer();
                      startTimer();
                      if(gameIndex == 0){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QuickplayResultScreen()),
                        );
                      };
                    },
                    label: const Text(
                      'Failed',
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
}
