import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GameScreen.dart';
import 'HomeScreen.dart';
import 'package:thinking_crisis/Controller/QuickPlay.dart';
enum roundOptions{two,three}
class QuickplayOptionsScreen extends StatefulWidget {
  const QuickplayOptionsScreen({Key? key}) : super(key: key);
  @override
  State<QuickplayOptionsScreen> createState() => _QuickplayOptionsScreenState();
}
class _QuickplayOptionsScreenState extends State<QuickplayOptionsScreen>{
  roundOptions _rounds = roundOptions.two;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Quickplay',
              style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                  fontFamily: 'Freestyle Script'
              ),
            ),
            const SizedBox(height: 50),
            const SizedBox(height: 10),
            const Text(
              'How many rounds?',
              style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  fontFamily: 'Freestyle Script'
              ),
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                    title: const Text(
                        '2',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,)
                    ),
                    leading: Radio<roundOptions>(
                      activeColor: Colors.black,
                      value: roundOptions.two,
                      groupValue: _rounds,
                      onChanged: (roundOptions? value){
                        setState(() {
                          _rounds = value!;
                        });
                      },
                    )
                ),
                ListTile(
                    title: const Text(
                        '3',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,)
                    ),
                    leading: Radio<roundOptions>(
                      activeColor: Colors.black,
                      value: roundOptions.three,
                      groupValue: _rounds,
                      onChanged: (roundOptions? value){
                        setState(() {
                          _rounds = value!;
                        });
                      },
                    )
                ),
                CupertinoSegmentedControl(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                    borderColor: Colors.white,
                    selectedColor: Colors.red,
                    pressedColor: Colors.green,
                    unselectedColor: Theme.of(context).primaryColor,
                    children: {
                      30: buildRoundTimeSelectItem("30s"),
                      60: buildRoundTimeSelectItem("60s"),
                      90: buildRoundTimeSelectItem("90s"),
                      120: buildRoundTimeSelectItem("120s"),
                    },
                    onValueChanged: (value){
                      setState(() {

                      });
                    },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                    width: 150,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.thumb_down_alt_sharp,
                        color: Colors.red,
                        size: 30,
                      ),
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(width: 3.0, color: Colors.red),
                        elevation: 10,
                        backgroundColor: Colors.white,
                        minimumSize: const Size(100.0, 20.0),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      label: const Text(
                        "Exit",
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            fontFamily: 'Freestyle Script'
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 150,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.thumb_up_off_alt_sharp,
                        color: Colors.green,
                        size: 30,
                      ),
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(width: 3.0, color: Colors.green),
                        elevation: 10,
                        backgroundColor: Colors.white,
                        minimumSize: const Size(100.0, 20.0),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GameScreen()),
                        );
                      },
                      label: const Text(
                          "Start",
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                              fontFamily: 'Freestyle Script'
                          ),
                        ),
                      ),
                    ),
                ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRoundTimeSelectItem(String text) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}