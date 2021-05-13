import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

class GeneratePage extends StatefulWidget {
  @override
  _GeneratePageState createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  String qrData = 'https://github.com/neon97';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Génère"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            QrImage(data: qrData),
            SizedBox(height: 10.0),
            TextField(
              controller: qrText,
              decoration: InputDecoration(
                hintText: "Entrer le numero ID ",
              ),
            ),
            SizedBox(height: 20.0),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              child: Text("Génère QR CODE"),
              onPressed: () {
                if (qrText.text.isEmpty) {
                  setState(() {
                    qrData = "https://flutter.dev";
                  });
                } else {
                  qrData = qrText.text;
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.green, width: 3.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final qrText = TextEditingController();
}
