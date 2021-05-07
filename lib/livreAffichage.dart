import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:easyqrapp/scan.dart';
import 'package:qrscan/qrscan.dart';

Future<Livre> fetchLivre() async {
  final response = await http.get("http://10.0.2.2:3000/livre/" '$code_barre');

  print(code_barre);
  code_barre=null;
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Livre.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Veuillez saisir un livre');
  }
}

class Livre {
  final int id;
  final String titre;
  final String auteur;
  final String edition;
  final String pages;
  final String resumer;
  final String langue;
  final String codebarre;

  Livre(
      {@required this.id,
      @required this.titre,
      @required this.auteur,
      @required this.edition,
      @required this.pages,
      @required this.resumer,
      @required this.langue,
      @required this.codebarre});

  factory Livre.fromJson(Map<String, dynamic> json) {
    return Livre(
      id: json['id'],
      titre: json['titre'],
      auteur: json['auteur'],
      edition: json['edition'],
      pages: json['pages'],
      resumer: json['resumer'],
      langue: json['langue'],
      codebarre: json['codebarre'],
    );
  }
}

class livreAffichage extends StatefulWidget {
  livreAffichage(text);

  @override
  _livreAffichageState createState() => _livreAffichageState();
}

class _livreAffichageState extends State<livreAffichage> {
  @override
  Future<Livre> futureLivre;

  @override
  void initState() {
    super.initState();
    futureLivre = fetchLivre();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Livre recherché'),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<Livre>(
            future: futureLivre,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                        '\t'+'Titre: ' +
                        snapshot.data.titre +
                        '\n' +
                        '\n' +
                        '\t'+'Auteur: ' +
                        snapshot.data.auteur +
                        '\n' +
                        '\n' +
                        '\t'+'Edition: ' +
                        snapshot.data.edition +
                        '\n' +
                        '\n' +
                        '\t'+'Pages: ' +
                        snapshot.data.pages +
                        '\n' +
                        '\n' +
                        '\t'+'Resumer: ' +
                        snapshot.data.resumer +
                        '\n' +
                        '\n' +
                        '\t'+'Langue: ' +
                        snapshot.data.langue +
                        '\n' +
                        '\n' +
                        '\t'+'Code barre: ' +
                        snapshot.data.codebarre,
                    style: TextStyle(
                      fontSize: 20.0,
                    ));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },

            /* body: Center(
          //Column(children: <Widget>[
          child: FutureBuilder<Livre>(
            future: futureLivre,
            builder: (context, snapshot) {
              /*String cb= snapshot.data.codebarre;
              String t= snapshot.data.titre;
              String a= snapshot.data.auteur;
              String e= snapshot.data.edition;
              String p= snapshot.data.pages;
              String r= snapshot.data.resumer;
              String l= snapshot.data.langue;*/

              if (snapshot.hasData) {
                return Text(snapshot.data.titre);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),*/

            /*Container(
            padding: EdgeInsets.all(30.0),
            color: Colors.green,
            child: Text('12'),             
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            color: Colors.green,
            child: Text('yo5555555o'),            
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            color: Colors.green,
            child: Text('Vincent'),            
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            color: Colors.green,
            child: Text('oyoy0000'),            
          ),          
          Container(
            padding: EdgeInsets.all(30.0),
            color: Colors.green,
            child: Text('270'),            
          ),          
          Container(
            padding: EdgeInsets.all(30.0),
            color: Colors.green,
            child: Text('un yoyo fait du'),            
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            color: Colors.green,
            child: Text('xy'),            
            ),
          ]
        ),*/
          ),
        ),
      ),
    );
  }
}
