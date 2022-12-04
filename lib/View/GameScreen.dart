import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thinking_crisis/Controller/GameScore.dart';
import 'package:thinking_crisis/Controller/QuickPlay.dart';
import 'package:thinking_crisis/Model/PromptPool.dart';
import 'package:thinking_crisis/View/QuickplayResultScreen.dart';
import '../View/HomeScreen.dart';
import 'dart:math';
import 'package:thinking_crisis/Model/PromptPool.dart';
class GameScreen extends StatefulWidget {

  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late int index;
  Timer? countdownTimer;
  Duration roundDuration = Duration(seconds: QuickPlay.roundTime);
  void startTimer(){
    countdownTimer = Timer.periodic(Duration(seconds: 1),(_) => setCountdown());
  }
  void stopTimer(){
    setState(() => countdownTimer!.cancel());
  }
  void resetTimer(){
    stopTimer();
    setState(() => roundDuration = Duration(seconds: QuickPlay.roundTime));
  }
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
  }
  void onNext(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    final PromptPool promptP = new PromptPool();
    var num = new Random();
    var randPrompt = num.nextInt(promptP.quickPlayLength);
    int gameIndex = QuickPlay.roundAmount;
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              promptP.quickPlayList[randPrompt],
              style: TextStyle(
                  letterSpacing: 5.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 90.0,
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
                          style: TextStyle(
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
                      gameIndex--;
                      GameScore.currentPoints++;
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
                      gameIndex--;
                      GameScore.incorrectPoints++;
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
