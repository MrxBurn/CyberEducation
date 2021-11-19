// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_education/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'quiz.dart';
import 'retest.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //Firestore
  DocumentReference userName = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  //Variables
  int _selectedIndex = 0;
  var firstName = '';

  //Controllers

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (_selectedIndex == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Homepage()));
      } else if (_selectedIndex == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Quiz()));
      } else if (_selectedIndex == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ReTest()));
      } else {
        FirebaseAuth.instance.signOut();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    userName.get().then((DocumentSnapshot ds) {
      firstName = ds['firstName'];
      print(firstName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz_sharp),
            label: 'Re-test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Sign Out',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
      body: Column(
        children: [
          FutureBuilder<DocumentSnapshot>(
            future: userName.get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return const Text("Document does not exist");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Text("Welcome ${data['firstName']}");
              }

              return const Text("loading");
            },
          ),
          Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Text(firstName)),
        ],
      ),
    );
  }
}
