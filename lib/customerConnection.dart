import 'dart:async';
import 'dart:convert';
import 'package:easyqrapp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:easyqrapp/user.dart';
                                                                                  // Connection des Customers
Future<Customer> fetchCustomer() async {
  final response = await http.get("http://10.0.2.2:4000/customer/" '$email');     //Cherche les customer par Email

  if (response.statusCode == 200) {

    return Customer.fromJson(jsonDecode(response.body));
  } else {

    throw Exception('Failed to load customer');                                   //Si le Email est introuvable, une erreur s'affichera
  }
}

class Customer {
  final int id;
  final String name;
  final String email;
  final String password;

  Customer(
      {@required this.id,
      @required this.name,
      @required this.email,
      @required this.password});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }
}

class customerConnection extends StatefulWidget {
  customerConnection(email, password);

  @override
  _customerConnectionState createState() => _customerConnectionState();
}

class _customerConnectionState extends State<customerConnection> {
  @override
  Future<Customer> futureCustomer;

  @override
  void initState() {
    super.initState();
    futureCustomer = fetchCustomer();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connection',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Connection'),
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, false),
          )
        ),
        body: Center(
          child: FutureBuilder<Customer>(
            future: futureCustomer,
            builder: (context, snapshot) {
              if (password == snapshot.data.password) {                           //Si le compte existe dans la base de donnée
                return Scaffold(                                                  //Nous comparons le mot de passe (MP) que l'ustilisateur écrit, 
                                                                                  //avec celui de la base de donnée et si les deux MP sont pareil, 
                                                                                  //l'application t'apporte vers une page de connection réussi.
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(30.0),
                        width: 300.0,
                        child: Text(
                          'Connection réussi',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0),
                        ),
                      ),
                      SizedBox(height: 60.0),
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
                                    builder: (context) => HomePage()),
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
                      Container(
                        width: 356.0,
                        height: 250.0,
                        child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtWQS3bZpy9LIQuOa_HH_vsMburHACdxOMwDS4eEXcJ9bVJb73PiNyRzaJ34UyU7fz6v0&usqp=CAU"),
                      ),
                    ],
                  ),
                );
              }
              if (password != snapshot.data.password) {                           //Si le compte N'existe PAS dans la base de donnée
                return Scaffold(                                                  //Nous comparons le mot de passe (MP) que l'ustilisateur écrit, 
                                                                                  //avec celui de la base de donnée et si les deux MP NE sont PAS pareil, 
                                                                                  //l'application t'apporte vers une page d'échec de connection.
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(30.0),
                        width: 300.0,
                        child: Text(
                          'Échec de connection',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0),
                        ),
                      ),
                      SizedBox(height: 60.0),
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
                                    builder: (context) => User()),
                              );
                            },
                            child: Center(
                              child: Text(
                                'Réessayer',
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
                      Container(
                        width: 356.0,
                        height: 250.0,
                        child: Image.network(
                            "http://la-beaulieu.com/wp-content/uploads/2020/10/SMILEY-TRISTE.jpg"),
                      ),
                    ],
                  ),
                );
              }

              return CircularProgressIndicator();                                 //Si aucune des deux conditions est prise, il y aura un cercle de loading
            },
          ),
        ),
      ),
    );
  }
}
