import 'package:flutter/material.dart';
import 'package:easyqrapp/livreAffichage.dart';
                                                                                  // Endroit où le customer entre
class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

String code_barre;

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Saisi du code barre"),
        centerTitle: true
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Veuillez saisir le code barre",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Code barre',
                labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
              onChanged: (text) {                                                 //Utilise le champ de texte du CB pour l'envoyer dans la classe livreAffichage
                code_barre = text;
              },
            ),
            SizedBox(height: 10.0),
            FlatButton(
              child: Text("Enregistrer"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => livreAffichage(code_barre)),
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.green, width: 3.0)),
            ),
          ],
        ),
      ),
    );
  }
}
