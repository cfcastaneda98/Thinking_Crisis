import 'package:flutter/material.dart';
import 'package:thinking_crisis/Controller/QuickPlay.dart';
import 'package:thinking_crisis/View/AboutScreen.dart';
import 'package:thinking_crisis/View/QuickplayOptionsScreen.dart';

import 'Over18Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Center(
        child: Container(
        padding: EdgeInsets.all(30.0),
         child: GridView.count(
           crossAxisCount: 2,
            children: <Widget>[
              //Left(1) Icon
              Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  child: ElevatedButton(
                    onPressed:(){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuickplayOptionsScreen()),
                      );
                    },
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.punch_clock,size: 70.0,),
                        Text('Quickplay',style: new TextStyle(fontSize: 17.0))
                      ],
                    ),
                  ),
                 ),
                ),
              ),

              //Right(2) icon
              Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){},
                  splashColor: Colors.black,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: <Widget>[
                        Icon(Icons.check_box,size: 70.0,),
                        Text('CreateList',style: new TextStyle(fontSize: 17.0))
                      ],
                    ),
                  ),
                ),
              ),

              Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){},
                  splashColor: Colors.black,
                  child: ElevatedButton(
                    onPressed:(){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Over18Screen()),
                      );
                    },
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.block_flipped,size: 70.0,),
                          Text('18+ Game',style: new TextStyle(fontSize: 17.0))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //Right(2) icon
              Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){},
                  splashColor: Colors.black,
                  child: ElevatedButton(
                    onPressed:(){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutScreen()),
                      );
                    },
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.account_circle,size: 70.0,),
                        Text('About',style: new TextStyle(fontSize: 17.0))
                      ],
                    ),
                  ),
                  ),
                ),
              ),
            ],
       ),
     ),
      ),
    );
  }
}
