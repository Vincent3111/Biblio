import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart';
import 'package:easyqrapp/livreAffichage.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

//var monlivre;
String text = null;
String code_barre;

class _ScanPageState extends State<ScanPage> {
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
              onChanged: (text) {
                print(text);
                code_barre = text;
              },
            ),
            SizedBox(height: 10.0),
            FlatButton(
              child: Text("Enregistrer"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => livreAffichage(text)),
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
