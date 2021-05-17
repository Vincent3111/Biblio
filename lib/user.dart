import 'package:flutter/material.dart';
import 'package:easyqrapp/customerConnection.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

String email;
String password;

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("UTILISATEUR"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Adresse courriel',
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                onChanged: (caseVide) {
                  print(caseVide);
                  email = caseVide;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                  onChanged: (caseVide) {
                  print(caseVide);
                  password = caseVide;
                },
                obscureText: true,
              ),
              SizedBox(height: 40.0),
              Container(
                height: 40.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.green,
                  color: Colors.green,
                  elevation: 7.0,
                  child: GestureDetector(
                   /* onTap: () {
                      Navigator.of(context).pushNamed('/homepage');
                    },*/
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => customerConnection(email, password)),
                      );
                    },
                    child: Center(
                      child: Text(
                        'Se connecter',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                height: 40.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.green,
                  color: Colors.green,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    child: Center(
                      child: Text(
                        'Créer un compte',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
