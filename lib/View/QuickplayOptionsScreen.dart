import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GameScreen.dart';
import 'HomeScreen.dart';
import 'package:thinking_crisis/Controller/QuickPlay.dart';

class QuickplayOptionsScreen extends StatefulWidget {
  const QuickplayOptionsScreen({Key? key}) : super(key: key);
  @override
  State<QuickplayOptionsScreen> createState() => _QuickplayOptionsScreenState();
}
class _QuickplayOptionsScreenState extends State<QuickplayOptionsScreen>{
  int selectedSecondsValue = 30;
  Map<int,Widget> childrenSeconds = <int,Widget>{
    30: const Text ("30s"),
    60: const Text ("60s"),
    90: const Text ("90s"),
    120: const Text ("120s"),
  };
  int selectedRoundValue = 1;
  Map<int,Widget> childrenRounds = <int,Widget>{
    1: const Text ("1"),
    2: const Text ("2"),
    3: const Text ("3"),
  };
  @override
  void initState(){
    setState(() {
        QuickPlay.roundAmount = selectedRoundValue;
        QuickPlay.roundTime = selectedSecondsValue;
    });
  }
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
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  child: CupertinoSegmentedControl<int>(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    borderColor: Colors.black,
                    selectedColor: Colors.blueAccent,
                    pressedColor: Colors.blue,
                    unselectedColor: Colors.white,
                    groupValue: selectedRoundValue,
                    children: childrenRounds,
                    onValueChanged: (value){
                      selectedRoundValue = value;
                      setState(() {
                        QuickPlay.roundAmount = selectedRoundValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            Text(
              '${QuickPlay.roundAmount}',
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'How many seconds?',
                  style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      fontFamily: 'Freestyle Script'
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: CupertinoSegmentedControl<int>(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        borderColor: Colors.black,
                        selectedColor: Colors.blueAccent,
                        pressedColor: Colors.blue,
                        unselectedColor: Colors.white,
                        groupValue: selectedSecondsValue,
                        children: childrenSeconds,
                        onValueChanged: (value){
                          selectedSecondsValue = value;
                          setState(() {
                            QuickPlay.roundTime = selectedSecondsValue;
                          });
                        },
                      ),
                    ),
                    Text(
                      '${QuickPlay.roundTime}',
                    ),
                  ],
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