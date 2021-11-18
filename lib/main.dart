// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_education/homepage.dart';
import 'package:cyber_education/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Error");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return Login();
            }

            return CircularProgressIndicator();
          },
        ));
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Firebase
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Variables
  String email = '';
  String password = '';
  String firstName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 30,
              ),
              child: SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  onChanged: (value) => email = value,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  onChanged: (value) => password = value,
                ),
              ),
            ),
          ),
          Center(
              child: Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: SizedBox(
              width: 70,
              height: 40,
              child: ElevatedButton(
                child: Text('Login'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange),
                ),
                onPressed: () {
                  //Login
                },
              ),
            ),
          )),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: TextButton(
                child: Text('Not a user? Register!'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
