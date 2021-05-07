import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart';

class SaisiCodeBarre extends StatefulWidget {
  @override
  _SaisiCodeBarreState createState() => _SaisiCodeBarreState();
}

class _SaisiCodeBarreState extends State<SaisiCodeBarre> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Saisi du code barre"),
        centerTitle: true,
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
              obscureText: false,
              onChanged: (text) {
                print(text);
              },
            ),
            SizedBox(height: 10.0),
            FlatButton(
              child: Text("Enregistrer"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => livreAffichage()),
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

livreAffichage() {}
