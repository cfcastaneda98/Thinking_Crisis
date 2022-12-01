import 'package:flutter/material.dart';
import 'package:thinking_crisis/Controller/QuickPlay.dart';
import '../View/HomeScreen.dart';
import 'dart:math';
final QuickPlay quickPlay = QuickPlay();
class GameScreen extends StatefulWidget {


  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder:
          (context, orientation){
        if(orientation != Orientation.portrait)
        {
          return potrait(context);
        }//end if
        else{
          return landscape(context);
        }
      },
      ),
    );
  }
}
Widget potrait(BuildContext context)
{
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
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ],
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "You are in Portrait mode",
            style: TextStyle(
                fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 70.0,
                fontFamily: 'Freestyle Script'
            ),
          ),
          Text(
            "Number of players: ${quickPlay.players}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
          Text(
            "Number of rounds: ${quickPlay.rounds}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
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
                          '60',
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
        ],
      ),
    ),
  );
}
Widget landscape(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.lightBlue[100],
    appBar: AppBar(
      backgroundColor: Colors.lightBlue[100],
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
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Please turn the phone in portrait mode.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 30.0,
            ),
          ),
        ],
      ),
    ),
  );
}
