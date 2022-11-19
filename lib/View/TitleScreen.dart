import 'package:flutter/material.dart';
import 'HomeScreen.dart';
class TitleScreen extends StatelessWidget{
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
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
           ],
          ),
        ),
    );
  }
}