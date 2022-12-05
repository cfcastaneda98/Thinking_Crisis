// Author: Carlos Castaneda, Isaac Campos
// Class: CS 4381
// Date modified: 12/4/22
// Instructor: Yoonsik Cheon
// Assignment: Thinking Crisis (Semester Project) (8 of 16)
// Purpose: Practice our skills to create our very own application
// which in this case is a guessing party game that uses only one phone.
// Implements the logic for the about screen
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Model/thinking_crisis_icons_icons.dart';
import 'HomeScreen.dart';
///Displays the information of who made the application
class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}
class _AboutScreenState extends State<AboutScreen>{
  @override
  ///Method that initializes logic for this particular page
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
      backgroundColor: Colors.lightBlue[100],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 30),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(ThinkingCrisisIcons.asset_6,size: 80),
                const Text(
                  ' About',
                  style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                      fontFamily: 'Freestyle Script'
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Authors:',
              style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  fontFamily: 'Freestyle Script'
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Isaac Campos',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Text(
              'Carlos Fernando Castaneda',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tools:',
              style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  fontFamily: 'Freestyle Script'
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Flutter',
              style: TextStyle(
                color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
              ),
            ),
            const Text(
              'Android Studio',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Text(
              'Adobe Illustrator',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
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
                  Navigator.of(context).push(_createRoute());
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