import 'package:flutter/material.dart';
import 'package:easyqrapp/customerCreation.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}
String name;
String email;
String password;
class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Créer un compte"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Nom',
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
                name = caseVide;
              },
            ),
            SizedBox(height: 10.0),
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
            SizedBox(height: 10.0),
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
              obscureText: true,
                            onChanged: (caseVide) {
                print(caseVide);
                password = caseVide;
              },
            ),
            SizedBox(height: 50.0),
            Container(
              height: 40.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.green,
                color: Colors.green,
                elevation: 7.0,
                child: GestureDetector(
                  onTap: () {
                 Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => customerCreation(name, email, password)),
                      );
                  },
                  child: Center(
                    child: Text(
                      'Créer',
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
      ),
    );
  }
}
