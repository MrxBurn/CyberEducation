// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  //Controllers
  TextEditingController cEmail = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController cFirstName = TextEditingController();

//Variables
  String email = '';
  String password = '';
  String firstName = '';
  String uid = '';

  final _formKey = GlobalKey<FormState>();

  Future<void> registerUser() async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    uid = FirebaseAuth.instance.currentUser!.uid;

    print('ID USER: ' + uid);

    ref.doc(uid).set({
      'firstName': firstName,
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: Form(
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
                    ),
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
                    ),
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
                        return 'Enter a password';
                      }
                    },
                    controller: cPassword,
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                    onChanged: (value) => password = value,
                  ),
                ),
              )),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: ElevatedButton(
                    child: const Text('Register'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
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
              )
            ],
          ),
        ));
  }
}
