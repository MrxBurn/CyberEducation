// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_education/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  //Controllers
  TextEditingController cEmail = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController cFirstName = TextEditingController();

//Variables
  String email = '';
  String password = '';
  String firstName = '';
  int scoreOne = 0;
  int scoreTwo = 0;
  String uid = '';

  //RegEx Pattern to make the user create a stronger password
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  final _formKey = GlobalKey<FormState>();

  //Register User function with the email and password provided from the registration form
  Future<void> registerUser() async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    //Get the user's registered id
    uid = FirebaseAuth.instance.currentUser!.uid;

    //Debug to check the actual ID
    print('ID USER: ' + uid);

    //Set pre-defined scores and the firstname in the database
    ref.doc(uid).set({
      'firstName': firstName,
      'score_one': scoreOne,
      'score_two': scoreTwo,
    });

    //Automatically navigate to the home page
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  //Register Form
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
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
                        children: [
                          Center(
                              child: Padding(
                            padding: EdgeInsets.only(
                              top: 30,
                            ),
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Enter your first name';
                                  }
                                },
                                controller: cFirstName,
                                autocorrect: false,
                                decoration: InputDecoration(
                                    hintText: 'First name',
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintStyle: TextStyle(color: Colors.white)),
                                onChanged: (value) => firstName = value,
                              ),
                            ),
                          )),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                            ),
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Enter your email';
                                  }
                                },
                                controller: cEmail,
                                autocorrect: false,
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintStyle: TextStyle(color: Colors.white)),
                                onChanged: (value) => email = value,
                              ),
                            ),
                          )),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                            ),
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Enter a password!';
                                  } else {
                                    RegExp regExp = RegExp(pattern);

                                    if (!regExp.hasMatch(text)) {
                                      return 'Password must include !,@,#, 0-9, A-a';
                                    }
                                  }
                                },
                                controller: cPassword,
                                autocorrect: false,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintStyle: TextStyle(color: Colors.white)),
                                onChanged: (value) => password = value,
                              ),
                            ),
                          )),
                          ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.only(
                                  top: 50,
                                ),
                                child: SizedBox(
                                  width: 90,
                                  height: 50,
                                  child: ElevatedButton(
                                    child: const Text('Register'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.orange),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        await registerUser();

                                        cEmail.clear();
                                        cPassword.clear();
                                        cFirstName.clear();
                                      }
                                    },
                                  ),
                                ),
                              )))
                        ],
                      ),
                    )))));
  }
}
