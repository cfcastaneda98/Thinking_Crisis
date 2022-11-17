import 'package:flutter/material.dart';
import 'HomeScreen.dart';
class TitleScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,

                    offset: Offset(5,5),
                  ),
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(-5,-5),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "Button",
                  style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                    fontSize: 44,
                    fontFamily: 'Freestyle Script'
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}