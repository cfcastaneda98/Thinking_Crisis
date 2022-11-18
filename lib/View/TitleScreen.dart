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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 100,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
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