import 'dart:async';
import 'dart:convert';
import 'package:easyqrapp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
                                                                                  // Création des Customers
class Post {                                                                      //Le code est écrit, mais n'est pas fonctionnel par manque de temps. 
  final int id;                                                                   //Il aurait fallu corriger l'erreur générée par: CREATE_POST_URL (à la ligne 117), 
  final String name;                                                              //lorsque l'application roule
  final String email;
  final String password;

  Post({this.id, this.name, this.email, this.password});

  factory Post.fromJson(Map json) {
    return Post(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map toMap() {
    var map = new Map();
    map["name"] = name;
    map["email"] = email;
    map["password"] = password;
    return map;
  }
}

Future createPost(String url, {Map name}) async {
  return http
      .post("http://10.0.2.2:4000/customer")                                      //Lien pour Post un Customer
      .then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");                           //Si le lien est introuvable, une erreur s'affichera
    }
    return Post.fromJson(json.decode(response.body));
  });
}

class CustomerCreation extends StatelessWidget {
  CustomerCreation(this.post);
  final Future post;

  static final CREATE_POST_URL = 'https://jsonplaceholder.typicode.com/posts';    //Pas le bon lien. Ce lien est un endroit général pour tester un Post.
  TextEditingController nameControler = new TextEditingController();
  TextEditingController emailControler = new TextEditingController();
  TextEditingController passwordControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Créer un compte",
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: true,
              title: Text('Créer un compte'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context, false),
              )
              ),
          body: new Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new Column(
              children: [
                new TextField(
                  controller: nameControler,
                  decoration: InputDecoration(                                    //Inscrire son nom pour la création du compte
                      hintText: "nom....",
                      labelText: 'Veuillez saisir votre nom'),
                ),
                new TextField(
                  controller: emailControler,
                  decoration: InputDecoration(                                    //Inscrire son email pour la création du compte
                      hintText: "courriel....",
                      labelText: 'Veuillez saisir votre courriel'),
                ),
                new TextField(
                  controller: passwordControler,
                  decoration: InputDecoration(                                    //Inscrire son MP pour la création du compte
                      hintText: "mot de passe....",
                      labelText: 'Veuillez saisir votre mot de passe'),
                ),
                new RaisedButton(
                  onPressed: () {
                    TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.green, width: 3.0),
                  ),
                  /*  Post newPost = new Post(
                        id: 0,                                                    //Si nous avions plus de temps, nous aurions pu le continuer 
                        name: nameControler.text,                                 //pous le rendre fonctionnel.
                        email: emailControler.text,
                        password: passwordControler.text);
                    Post p = await createPost(CREATE_POST_URL,
                        name: newPost.toMap());
                    
*/

                  child: const Text("Create"),
                )
              ],
            ),
          )),
    );
  }
}
