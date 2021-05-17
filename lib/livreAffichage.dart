import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:easyqrapp/scan.dart';

                                                                                  // Affichage des livres
Future<Livre> fetchLivre() async {
  final response = await http.get("http://10.0.2.2:3000/livre/"
      '$code_barre');                                                             //À l'aide du code barre (CB), il nous est
                                                                                  //possible de parcourir la base de donée
                                                                                  //des livres et d'afficher le conenu spécifique au CB inscrit.
  code_barre = null;
  if (response.statusCode == 200) {
    return Livre.fromJson(jsonDecode(response.body));
  } else {
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
            automaticallyImplyLeading: true,
            title: Text('Livre Recherché'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            )),
        body: Container(
          child: FutureBuilder<Livre>(
                                                                                  //Code de l'affichage des livres formatés.
            future: futureLivre,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                    '\t' +
                        'Titre: ' +
                        snapshot.data.titre +
                        '\n' +
                        '\n' +
                        '\t' +
                        'Auteur: ' +
                        snapshot.data.auteur +
                        '\n' +
                        '\n' +
                        '\t' +
                        'Edition: ' +
                        snapshot.data.edition +
                        '\n' +
                        '\n' +
                        '\t' +
                        'Pages: ' +
                        snapshot.data.pages +
                        '\n' +
                        '\n' +
                        '\t' +
                        'Resumer: ' +
                        snapshot.data.resumer +
                        '\n' +
                        '\n' +
                        '\t' +
                        'Langue: ' +
                        snapshot.data.langue +
                        '\n' +
                        '\n' +
                        '\t' +
                        'Code barre: ' +
                        snapshot.data.codebarre,
                    style: TextStyle(
                      fontSize: 20.0,
                    ));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
