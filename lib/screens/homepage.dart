import 'package:flutter/material.dart';

import 'package:doggopedia/wiki_api/xmlParser.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          child: Column(
            children: <Widget>[
              Container(
                height: 412.0,
                width: 412.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/doggo.jpg'),
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Tap on the pawww!',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent[100],
                    fontFamily: 'Shadows_Into_Light',
                  ),
                ),
              ),
              new IconButton (
                icon: Icon(Icons.pets, color: Colors.red),
                iconSize: 60.0,
                onPressed: () {
                  XmlParser.loadDogBreeds().whenComplete(() => Navigator.pushNamed(context, '/secondpage'));
                }
              ),
            ],
          ),
        ));
  }
}