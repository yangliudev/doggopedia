import 'package:flutter/material.dart';

class GermanShepherd extends StatefulWidget {
  @override
  _GermanShepherdState createState() => _GermanShepherdState();
}

class _GermanShepherdState extends State<GermanShepherd> {
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
                  'German Shepherd',
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
                    image: AssetImage('assets/german_shepherd.jpg'),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "The German Shepherd is a breed of medium to large-sized working dog that originated in Germany. In the English language, the breed's officially recognized name is German Shepherd Dog (GSD). The breed was officially known as the Alsatian in the UK from after the First World War until 1977 when its name was changed back to German Shepherd. Despite its primitive, wolf-like appearance the German Shepherd is a relatively modern breed of dog, with their origin dating to 1899.",
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