import 'package:flutter/material.dart';
import 'package:doggopedia/wiki_api/dogBreed.dart';
import 'webview.dart';

class DogTemplate extends StatefulWidget {
  @override
  _DogTemplateState createState() => _DogTemplateState();
}

class _DogTemplateState extends State<DogTemplate> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final DogBreed args = ModalRoute.of(context).settings.arguments;
    
    String title = args.text;
    String img = args.img;
    String detail = args.detail;
    if (img == null) img = '';
    if (detail == null) detail = '';
    String url = 'https://en.wikipedia.org/' + args.href;

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
                      title,
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
                      image: NetworkImage(img),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    detail,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent[200],
                      fontFamily: 'Shadows_Into_Light',
                    ),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewContainer(url)));
                    },
                    child: Text(
                      'Tap to see more information',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent[200],
                        fontFamily: 'Shadows_Into_Light',
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
