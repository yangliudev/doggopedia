import 'package:flutter/material.dart';

class Samoyed extends StatefulWidget {
  @override
  _SamoyedState createState() => _SamoyedState();
}

class _SamoyedState extends State<Samoyed> {
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
                  'Samoyed',
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
                    image: AssetImage('assets/samoyed.jpg'),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "The Samoyed is a breed of large herding dogs with thick, white, double-layer coats. They are related to the laika, a spitz-type dog. It takes its name from the Samoyedic peoples of Siberia. These nomadic reindeer herders bred the fluffy white dogs to help with herding. The Samoyed has been identified as a basal breed that predates the emergence of the modern breeds in the 19th Century. It belongs to the spitz or northern dog group, specifically the laikas, which is a Eurasian dog type.",
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