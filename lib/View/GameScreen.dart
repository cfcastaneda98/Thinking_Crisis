import 'package:flutter/material.dart';

import '../View/HomeScreen.dart';

class GameScreen extends StatefulWidget {


  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var quickPlayList = {
    'Horse',
    ''
  };
  var over18List = {
    'Johnny Sins',
  };
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
    backgroundColor: Colors.lightBlue[100],
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "You are in Portrait mode",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            height: 80,
            width: 220,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: const BorderSide(width: 3.0, color: Colors.black),
                elevation: 10,
                backgroundColor: Colors.white,
                minimumSize: const Size(100.0, 20.0),
              ),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: const Center(
                child: Text(
                  "Return to Home",
                  style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      fontFamily: 'Freestyle Script'
                  ),
                ),
              ),
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
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Please turn the phone in portrait mode.",
            style: TextStyle(
              color: Colors.red,
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            height: 80,
            width: 220,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: const BorderSide(width: 3.0, color: Colors.black),
                elevation: 10,
                backgroundColor: Colors.white,
                minimumSize: const Size(100.0, 20.0),
              ),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: const Center(
                child: Text(
                  "Return to Home",
                  style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      fontFamily: 'Freestyle Script'
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
