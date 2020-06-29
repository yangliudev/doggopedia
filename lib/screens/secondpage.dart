import 'package:flutter/material.dart';

import 'package:doggopedia/wiki_api/dogBreed.dart';
import 'package:doggopedia/wiki_api/dogBreeds.dart';
import 'package:doggopedia/wiki_api/xmlParser.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<DropdownMenuItem<DogBreed>> _dogbreedsDropdown;
  DogBreed _selectedDogBreed;

  @override
  void initState() {
    super.initState();
    List<DogBreed> dogbreeds = DogBreeds.getDogBreeds();
    _dogbreedsDropdown = buildDropdownMenuItems(dogbreeds);
    _selectedDogBreed = _dogbreedsDropdown[0].value;
  }

  List<DropdownMenuItem<DogBreed>> buildDropdownMenuItems(List<DogBreed> dogbreeds) {
    List<DropdownMenuItem<DogBreed>> items = List();
    for (DogBreed dogbreed in dogbreeds) {
      items.add(
        DropdownMenuItem(
          value: dogbreed,
          child: Text(dogbreed.text),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(DogBreed selectedDogBreed) async {
    setState(() {
      _selectedDogBreed = selectedDogBreed;
    });

    XmlParser.addDetails(_selectedDogBreed, false)
      .whenComplete(() => Navigator.pushNamed(context, '/info_dog_template', arguments: _selectedDogBreed));
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
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
              'Select a doggo',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent[100],
                fontFamily: 'Shadows_Into_Light',
              ),
            ),
            ),
          ),
          Container(
            child: Center(
              child: DropdownButton(
              value: _selectedDogBreed,
              items: _dogbreedsDropdown,
              onChanged: onChangeDropdownItem,
            ),
            ),
          ),
          //Text('Selected: ${_selectedDogBreed.title}'),
          Container(
            child: Center(
              child: Text(
              'Featured Doggos',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent[200],
                fontFamily: 'Shadows_Into_Light',
              ),
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Colors.pinkAccent[100],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: details1(),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage('assets/german_shepherd.jpg'),
                            ),
                          ),),
                      ],)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Colors.pinkAccent[100],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: details2(),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage('assets/samoyed.jpg'),
                            ),
                          ),),
                      ],)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Colors.pinkAccent[100],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: details3(),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage('assets/rat_terrier.jpg'),
                            ),
                          ),),
                      ],)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Colors.pinkAccent[100],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: details4(),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage('assets/shiba_inu.jpg'),
                          ),
                        ),),
                    ],)
              ),
            ),
          ),
        ),
      ],
    ),
  ),
  ),
  );
}

Widget details1() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(child: Text("German Shepherd",
          style: TextStyle(color: Colors.pinkAccent[100], fontSize: 24.0,fontWeight: FontWeight.bold, fontFamily: 'Shadows_Into_Light'),)),
      ),
      InkWell(
        child: Container(child: Text("Tap to read about me!",
        style: TextStyle(color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Shadows_Into_Light'),)),
        onTap: () {
          Navigator.pushNamed(context, '/info_german_shepherd');
        },
      ),
    ],
  );
}

Widget details2() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(child: Text("Samoyed",
          style: TextStyle(color: Colors.pinkAccent[100], fontSize: 24.0,fontWeight: FontWeight.bold, fontFamily: 'Shadows_Into_Light'),)),
      ),
      InkWell(
        child: Container(child: Text("Tap to read about me!",
        style: TextStyle(color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Shadows_Into_Light'),)),
        onTap: () {
          Navigator.pushNamed(context, '/info_samoyed');
        },
      ),
    ],
  );
}

Widget details3() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(child: Text("Rat Terrier",
          style: TextStyle(color: Colors.pinkAccent[100], fontSize: 24.0,fontWeight: FontWeight.bold, fontFamily: 'Shadows_Into_Light'),)),
      ),
      InkWell(
        child: Container(child: Text("Tap to read about me!",
        style: TextStyle(color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Shadows_Into_Light'),)),
        onTap: () {
          Navigator.pushNamed(context, '/info_rat_terrier');
        },
      ),
    ],
  );
}

Widget details4() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(child: Text("Shiba Inu",
          style: TextStyle(color: Colors.pinkAccent[100], fontSize: 24.0,fontWeight: FontWeight.bold, fontFamily: 'Shadows_Into_Light'),)),
      ),
      InkWell(
        child: Container(child: Text("Tap to read about me!",
        style: TextStyle(color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Shadows_Into_Light'),)),
        onTap: () {
          Navigator.pushNamed(context, '/info_shiba_inu');
        },
      ),
    ],
  );
}

}