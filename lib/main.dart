// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_final_fields
//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_education/homepage.dart';
import 'package:cyber_education/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final auth = FirebaseAuth.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        scrollBehavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        }),
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, snapshot) {
              if (ConnectionState.active == snapshot.connectionState) {}
              if (snapshot.hasData) {
                return Homepage();
              } else {
                return Login();
              }
            }));
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

  //Controllers
  TextEditingController cEmail = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  //Variables
  String email = '';
  String password = '';
  String firstName = '';

  final _formKey = GlobalKey<FormState>();

  //Method to log in the user
  Future<void> loginUser() async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    //Navigate to home page after logging in
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  Future<bool> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool accessToken = prefs.containsKey('accessToken');
    return accessToken;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.7),
                              spreadRadius: 3,
                              blurRadius: 2,
                              offset: Offset(0, 4))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color(0xff6e7f80).withOpacity(0.8)),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 30,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: TextFormField(
                                  controller: cEmail,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Email field empty';
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintStyle: TextStyle(color: Colors.white),
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
                                child: TextFormField(
                                  obscureText: true,
                                  controller: cPassword,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Password field empty';
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      hintText: 'Password',
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
                                  onChanged: (value) => password = value,
                                ),
                              ),
                            ),
                          ),
                          ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              child: Center(
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
                                          MaterialStateProperty.all<Color>(
                                              Colors.orange),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        cEmail.clear();
                                        cPassword.clear();

                                        loginUser();
                                      }
                                    },
                                  ),
                                ),
                              ))),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 20,
                              ),
                              child: TextButton(
                                child: Text(
                                  'Not a user? Register!',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7)),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    )))));
  }
}
