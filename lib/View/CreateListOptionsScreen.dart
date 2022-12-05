// Author: Carlos Castaneda, Isaac Campos
// Class: CS 4381
// Date modified: 12/4/22
// Instructor: Yoonsik Cheon
// Assignment: Thinking Crisis (Semester Project) (9 of 16)
// Purpose: Practice our skills to create our very own application
// which in this case is a guessing party game that uses only one phone.
// Implements the logic for the create list options
import 'package:flutter/material.dart';
import 'dart:async';
import 'HomeScreen.dart';
///Screen that displays the user the words they want to add to the game
class CreateListOptionsScreen extends StatefulWidget{
  const CreateListOptionsScreen({Key?  key}) : super(key: key);
  @override
  _CreateListOptionsScreen createState() => _CreateListOptionsScreen();
}
class _CreateListOptionsScreen extends State<CreateListOptionsScreen>{
  List<DynamicWidget> listDynamic = [];
  List<String> data = [];

  Icon floatingIcon = new Icon(Icons.add);
  ///Adds the item in a dynamic list
  addDynamic() {
    if (data.length != 0) {
      floatingIcon = new Icon(Icons.add);
      data = [];
      listDynamic = [];
      print('if');
    }
    setState(() {});
    if (listDynamic.length >= 5) {
      return;
    }
    listDynamic.add(new DynamicWidget());
  }
  ///Submits the data to be stored for later use
  submitData() {
    floatingIcon = new Icon(Icons.arrow_back);
    data = [];
    listDynamic.forEach((widget) => data.add(widget.controller.text));
    setState(() {});
    print(data.length);
  }
  @override
  Widget build(BuildContext context) {
    Widget result = Flexible(
        flex: 1,
        child: Card(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Text("${index + 1} : ${data[index]}"),
                    ),
                    const Divider()
                  ],
                ),
              );
            },
          ),
        ));
    Widget dynamicTextField = Flexible(
      flex: 2,
      child: ListView.builder(
        itemCount: listDynamic.length,
        itemBuilder: (_, index) => listDynamic[index],
      ),
    );
    Widget submitButton =  Container(
      child: ElevatedButton(
        onPressed: submitData,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Begin'),
        ),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue[100],
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[100],
          shadowColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.exit_to_app_sharp),
            iconSize: 50,
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).push(_createRoute());
            },
          ),
          title: const Text(
            'Create List',
            style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 60,
                fontFamily: 'Freestyle Script'
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              data.length == 0 ? dynamicTextField : result,
              data.length == 0 ? submitButton : new Container(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addDynamic,
          child: floatingIcon,
        ),
      ),
    );
  }
}
class DynamicWidget extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Enter Word '),
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