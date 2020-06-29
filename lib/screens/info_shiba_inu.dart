import 'package:flutter/material.dart';

class ShibaInu extends StatefulWidget {
  @override
  _ShibaInuState createState() => _ShibaInuState();
}

class _ShibaInuState extends State<ShibaInu> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("doggopedia"),
          backgroundColor: Colors.pinkAccent[100],
        ),
        backgroundColor: Colors.pink[50],
        body: SafeArea(
          child: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: Colors.pinkAccent[100],
          child: ListView(
            children: <Widget>[
              Container(
                child: Center(
                  child: Text(
                  'Shiba Inu',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent[100],
                    fontFamily: 'Shadows_Into_Light',
                  ),
                ),
              ),
              ),
              Container(
                height: 412.0,
                width: 412.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/shiba_inu.jpg'),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "The Shiba Inu is a Japanese breed of hunting dog. A small-to-medium breed, it is the smallest of the six original and distinct spitz breeds of dog native to Japan. A small, alert and agile dog that copes very well with mountainous terrain and hiking trails, the Shiba Inu was originally bred for hunting. It looks similar to and is often mistaken for other Japanese dog breeds like the Akita Inu or Hokkaido, but the Shiba Inu is a different breed with a distinct blood line, temperament, and smaller size.",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent[200],
                    fontFamily: 'Shadows_Into_Light',
                  ),
                ),
              ),
            ],
    )
    )
    )
    );
  }
}