// Author: Carlos Castaneda, Isaac Campos
// Class: CS 4381
// Date modified: 12/4/22
// Instructor: Yoonsik Cheon
// Assignment: Thinking Crisis (Semester Project) (15 of 16)
// Purpose: Practice our skills to create our very own application
// which in this case is a guessing party game that uses only one phone.
// Implements the logic for the about screen
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomeScreen.dart';
///Will display the initial page that greets the user
class TitleScreen extends StatelessWidget{
  @override
  void initState(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]
    );
  }
  @override
  Widget build(BuildContext context){
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      textStyle: const TextStyle(color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 44,
        fontFamily: 'Freestyle Script'
    ),);
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 30),
            Image.asset(
                'assets/images/thinking_crisis_title.png',
                height: 500,
            ),
            SizedBox(
              height: 100,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 3.0, color: Colors.black),
                  elevation: 10,
                  backgroundColor: Colors.white,
                  minimumSize: const Size(100.0, 20.0),
                ),
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
                child: const Center(
                  child: Text(
                    "Tap",
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 55,
                        fontFamily: 'Freestyle Script'
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ver 1.0.0',
                style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
              ),
            ),
            ),
           ],
          ),
        ),
    );
  }
}
///Controller that helps display the custom animation for this page
Route _createRoute(){
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child){
        const begin = Offset(0.0, 5.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin,end: end).chain(CurveTween(curve:curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
      );
    }
  );
}