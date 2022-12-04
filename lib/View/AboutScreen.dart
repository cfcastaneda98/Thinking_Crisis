import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomeScreen.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}
class _AboutScreenState extends State<AboutScreen>{
  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 30),
            const Text(
                'About',
              style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                  fontFamily: 'Freestyle Script'
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Authors:',
              style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  fontFamily: 'Freestyle Script'
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Issac Campos',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Text(
              'Carlos Fernando Castaneda',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tools:',
              style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  fontFamily: 'Freestyle Script'
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Flutter',
              style: TextStyle(
                color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
              ),
            ),
            const Text(
              'Android Studio',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Text(
              'Adobe Illustrator',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 80,
              width: 220,
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
                    "Return to Home",
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
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