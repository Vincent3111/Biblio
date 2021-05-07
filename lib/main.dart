import 'package:easyqrapp/generate.dart';
import 'package:easyqrapp/homepage.dart';
import 'package:easyqrapp/historique.dart';
import 'package:easyqrapp/scan.dart';
import 'package:easyqrapp/user.dart';
import 'package:flutter/material.dart';
import 'register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion Biblio',
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => new Register(),
        '/generate': (BuildContext context) => new GeneratePage(),
        '/homepage': (BuildContext context) => new HomePage(),
        '/scan': (BuildContext context) => new ScanPage(),
        '/historique': (BuildContext context) => new Historique(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(420.0)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 32.0),
                    Container(
                      width: 300.0,
                      child: Text(
                        'Gestion Biblio',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 32.0),
                      ),
                    ),
                    Container(
                      width: 356.0,
                      height: 250.0,
                      child: Image.network(
                          "https://image.freepik.com/free-vector/isometric-book-icon-flat-style_100456-389.jpg"),
                    ),
                    Container(
                      child: Text("Gèrer sa propre bibliothèque",
                          style:
                              TextStyle(fontSize: 30.0, color: Colors.green)),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      child: Text("et garder le sourire POUR DE VRAI!",
                          style:
                              TextStyle(fontSize: 30.0, color: Colors.green)),
                    ),
                    SizedBox(height: 60.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Admin(),
                                ));
                          },
                          backgroundColor: Colors.green,
                          child: Icon(Icons.add_to_home_screen),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
