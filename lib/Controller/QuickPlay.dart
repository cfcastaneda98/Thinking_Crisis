import 'package:flutter/material.dart';

class QuickPlay extends StatefulWidget {


  const QuickPlay({Key? key}) : super(key: key);

  @override
  State<QuickPlay> createState() => _QuickPlayState();
}

class _QuickPlayState extends State<QuickPlay> {
  var quickPlayList = {
    'Horse',
    ''
  };
  var over18List = {
    'Johnny Sins'
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Orientation",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45,
                fontFamily: 'Freestyle Script'
            ),
          ),
      ),
      body: OrientationBuilder(builder:
          (context, orientation){
            if(orientation != Orientation.portrait)
              {
                return potrait();
              }//end if
            else{
                return landscape();
             }
        },
      ),
    );
  }
}
Widget potrait()
{
  return Center(
    child: Text(
      "Potrait",
      style: TextStyle(
        color: Colors.black,
        fontSize: 30.0,
      ),
    ),
  );
}
Widget landscape(){
  return Center(
    child: Text(
      "landscape",
      style: TextStyle(
        color: Colors.red,
        fontSize: 30.0,
      ),
    ),
  );
}
