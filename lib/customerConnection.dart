import 'dart:async';
import 'dart:convert';
import 'package:easyqrapp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:easyqrapp/user.dart';
import 'package:qrscan/qrscan.dart';


Future<Customer> fetchCustomer() async {
  final response = await http.get("http://10.0.2.2:4000/customer/" '$email');

  print(email);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Customer.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load customer');
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
      title: 'Fetch Data',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Connection'),
        ),
        body: Center(
          child: FutureBuilder<Customer>(
            future: futureCustomer,
            builder: (context, snapshot) {

              if (password == snapshot.data.password) {
                return Scaffold(
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
              if (password != snapshot.data.password) {
                return Scaffold(
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
                                    builder: (context) => Admin()),
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
              /*backgroundColor: Colors.green,
                  child: Icon(Icons.add_to_home_screen),
                );*/
              /*} else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }*/

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
