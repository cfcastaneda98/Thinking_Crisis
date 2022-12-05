// Author: Carlos Castaneda, Isaac Campos
// Class: CS 4381
// Date modified: 12/4/22
// Instructor: Yoonsik Cheon
// Assignment: Thinking Crisis (Semester Project) (12 of 16)
// Purpose: Practice our skills to create our very own application
// which in this case is a guessing party game that uses only one phone.
// Implements the logic for the over 18 mode screen
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Model/thinking_crisis_icons_icons.dart';
import 'HomeScreen.dart';
///Similar game to quick play, but with raunchy words
class Over18Screen extends StatefulWidget {
  const Over18Screen({Key? key}) : super(key: key);
  @override
  State<Over18Screen> createState() => _Over18State();
}
class _Over18State extends State<Over18Screen>{
  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 50),
            const Text(
              'Naughty, Naughty....',
              style: TextStyle(color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  fontFamily: 'Freestyle Script'
              ),
            ),
            const SizedBox(height: 50),
            Icon(ThinkingCrisisIcons.asset_9,color: Colors.white,size: 180,),
            const SizedBox(height: 50),
            const Text(
              'This section is still a work in progress, but be on the lookout for a very "unique" playlist just for the grownups. ',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 80,
              width: 220,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 3.0, color: Colors.red),
                  elevation: 10,
                  backgroundColor: Colors.white,
                  minimumSize: const Size(100.0, 20.0),
                ),
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
                child: const Center(
                  child: Text(
                    "Return to Home",
                    style: TextStyle(color: Colors.red,
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
}
///Controller that helps display the custom animation for this page
Route _createRoute(){
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child){
        const begin = Offset(0.0, -5.0);
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