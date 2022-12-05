import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thinking_crisis/Controller/QuickPlay.dart';
import 'package:thinking_crisis/View/AboutScreen.dart';
import 'package:thinking_crisis/View/CreateListOptionsScreen.dart';
import 'package:thinking_crisis/View/QuickplayOptionsScreen.dart';

import '../Model/PromptPool.dart';
import 'Over18Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]
    );
  }
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
                      Navigator.of(context).push(_createRouteQuickPlay());
                    },
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.punch_clock_sharp,size: 70.0,),
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
                  child: ElevatedButton(
                    onPressed:(){
                      Navigator.of(context).push(_createRouteCreateList());
                    },
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.library_add_check_sharp,size: 70.0,),
                          Text('Create List',style: new TextStyle(fontSize: 17.0))
                        ],
                      ),
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
                      Navigator.of(context).push(_createRouteOver18());
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
                      Navigator.of(context).push(_createRouteAbout());
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
Route _createRouteQuickPlay(){
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const QuickplayOptionsScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child){
        const begin = Offset(-5.0, -5.0);
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
Route _createRouteCreateList(){
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const CreateListOptionsScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child){
        const begin = Offset(5.0, -5.0);
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
Route _createRouteOver18(){
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Over18Screen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child){
        const begin = Offset(-5.0, 5.0);
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
Route _createRouteAbout(){
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const AboutScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child){
        const begin = Offset(5.0, 5.0);
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
