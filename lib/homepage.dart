import 'package:easyqrapp/historique.dart';
import 'package:flutter/material.dart';
import 'package:easyqrapp/scan.dart';
import 'package:easyqrapp/generate.dart';
                                                                                  //Page principal de l'application.
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion Biblio"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(                                                            //Ce container est composé d'un bouton qui le dirige vers la classe GeneratePage.
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
                      MaterialPageRoute(builder: (context) => GeneratePage()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'GENERER QR CODE',
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
            SizedBox(height: 10.0),
            Container(                                                            //Ce container est composé d'un bouton qui le dirige vers la classe ScanPage.
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
                      MaterialPageRoute(builder: (context) => ScanPage()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'SCAN QR CODE',
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
            SizedBox(height: 10.0),
            Container(                                                            //Ce container est composé d'un bouton qui le dirige vers la classe Historique.
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
                      MaterialPageRoute(builder: (context) => Historique()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'HISTORIQUE',
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
