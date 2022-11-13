import 'package:flutter/material.dart';
import 'SecondScreen.dart';
class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(


        leading: IconButton(icon: Icon(Icons.menu), onPressed: (){

        }),

        title: Text("MainScreen"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: ()
          {
          }),
        ],
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
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
                boxShadow: [
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
              child: Center(
                child: Text(
                  "Button",
                  style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                    fontSize: 18
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


/*
*
*           child: RaisedButton(
            child: Text('Tap',
            style: TextStyle(

                color: Colors.blue,


              ),
            ),
            color: new Color(0xff622f74),
            onPressed: (){
                Navigator.push(context,

                MaterialPageRoute(builder: (context)=>HomeScreen()),
                );
             },

          ),
* */