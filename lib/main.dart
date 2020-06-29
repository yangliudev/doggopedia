import 'package:flutter/material.dart';

import 'package:doggopedia/screens/homepage.dart';
import 'package:doggopedia/screens/secondpage.dart';
import 'package:doggopedia/screens/info_dog_template.dart';
import 'package:doggopedia/screens/info_german_shepherd.dart';
import 'package:doggopedia/screens/info_samoyed.dart';
import 'package:doggopedia/screens/info_rat_terrier.dart';
import 'package:doggopedia/screens/info_shiba_inu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'doggopedia',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent[100],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/secondpage': (context) => SecondPage(),
        '/info_dog_template': (context) => DogTemplate(),
        '/info_german_shepherd': (context) => GermanShepherd(),
        '/info_samoyed': (context) => Samoyed(),
        '/info_rat_terrier': (context) => RatTerrier(),
        '/info_shiba_inu': (context) => ShibaInu(),
      },
    );
  }
}
