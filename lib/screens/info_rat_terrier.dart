import 'package:flutter/material.dart';

class RatTerrier extends StatefulWidget {
  @override
  _RatTerrierState createState() => _RatTerrierState();
}

class _RatTerrierState extends State<RatTerrier> {
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
                  'Rat Terrier',
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
                    image: AssetImage('assets/rat_terrier_eddie.jpg'),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "The Rat Terrier is an American dog breed with a background as a farm dog and hunting companion. They share much ancestry with the small hunting dogs known as feists. Common throughout family farms in the 1920s and 1930s, they are now recognized by the United and American Kennel Clubs and are considered a rare breed. Today's Rat Terrier is an intelligent and active small dog that is kept both for pest control and as a family pet. (Pictured above is my friend Eddie's dog, Bailey)",
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