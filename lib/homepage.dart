// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_education/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:webviewx/webviewx.dart';
import 'package:url_launcher/url_launcher.dart';

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

  var firstName = '';

  bool isNewRouteSameAsCurrent = false;

  final bool _customTileExpanded = false;

  //Controllers
  late WebViewXController webController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Text('Cyber-Training'),
              ),
              ListTile(
                leading: Icon(Icons.home_filled),
                title: const Text('Home'),
                onTap: () {
                  var route = ModalRoute.of(context);
                  var name = route?.settings.name;

                  Navigator.pop(context);

                  if (name != null && name != '/') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homepage()));
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.quiz_rounded),
                title: const Text('Quiz'),
                onTap: () {
                  // Update the state of the app.
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Quiz()));
                },
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: const Text('Test your cyber skills'),
                onTap: () {
                  // Update the state of the app.
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReTest()));
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle_rounded),
                title: const Text('Sign Out'),
                onTap: () {
                  // Update the state of the app.
                  FirebaseAuth.instance.signOut();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ],
          ),
        ),
        //BODY
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

                    return Center(
                        child: Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 30,
                            ),
                            child: Container(
                                height: 150,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 10,
                                          ),
                                          child: Text(
                                            "Welcome ${data['firstName']}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, left: 10),
                                          child: Text(
                                            "Score: ${data['score']}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ))
                                    ]))));
                  }
                  return const Text("loading");
                },
              ),
              //Useful websites part
              Center(
                  child: Column(children: [
                SizedBox(
                    width: 600,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 30,
                      ),
                      child: Text(
                        'Useful websites:',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )),
                SizedBox(
                    width: 600,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 30,
                      ),
                      child: InkWell(
                        child: Text(
                          "National Cyber Security Centre's website",
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                        onTap: () => launch(
                          'https://www.ncsc.gov.uk/section/advice-guidance/all-topics',
                        ),
                      ),
                    ))
              ])),

              //Most used cyber attacks section
              Center(
                  child: SizedBox(
                      width: 600,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, left: 30),
                        child: Text(
                          'The most used cyber attacks:',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ))),

              //1st Expansion Tile

              Center(
                  child: SizedBox(
                      width: 600,
                      child: Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 20,
                          ),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              child: ExpansionTile(
                                  collapsedBackgroundColor: Color(0xFF304e60),
                                  title: const Text('Malware Attacks'),
                                  leading: Image.asset(
                                    'images/malware.png',
                                  ),
                                  subtitle: const Text(
                                      'Malware usage is up almost 800% since early 2020.'),
                                  trailing: Icon(
                                    _customTileExpanded
                                        ? Icons.arrow_drop_down_circle
                                        : Icons.arrow_drop_down,
                                  ),
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "One of the most used type of malware is Ransomware.\n"
                                            "Ransomware is a type of malware from cryptovirology that threatens to publish the victim's personal data or perpetually block access to it unless a ransom is paid."),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text('Example: '),
                                        Image.asset('images/ransomware.png'),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Ransomware is often spread through phishing emails that contain malicious attachments or through drive-by downloading. Drive-by downloading occurs when a user unknowingly visits an infected website and then malware is downloaded and installed without the user’s knowledge."
                                            "Crypto ransomware, a malware variant that encrypts files, is spread through similar methods and has also been spread through social media, such as Web-based instant messaging applications."
                                            " Additionally, newer methods of ransomware infection have been observed. For example, vulnerable Web servers have been exploited as an entry point to gain access to an organization’s network.")
                                      ],
                                    )
                                  ]))))),

              //2nd Expansion Tile
              Center(
                  child: SizedBox(
                width: 600,
                child: Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 20,
                    ),
                    child: ExpansionTile(
                        title: const Text('Phishing'),
                        leading: Image.asset(
                          'images/phishing.png',
                        ),
                        subtitle: const Text(
                            'Phishing attacks are the most common cause of data breaches globally and have'
                            ' been the root cause of notable instances of cybercrime in the last decade.'),
                        trailing: Icon(
                          _customTileExpanded
                              ? Icons.arrow_drop_down_circle
                              : Icons.arrow_drop_down,
                        ),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Phishing attacks attempt to steal information from users or trick them into downloading malware by'
                                  'sending malicious emails or text messages (SMS) that look like real requests but are, in fact, a Scam.\n'
                                  '\nExample:'),
                              SizedBox(
                                height: 20,
                              ),
                              Image.asset('images/amazon.png'),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                  'It occurs when an attacker, masquerading as a trusted entity, dupes a victim into opening '
                                  'an email, instant message, or text message. The recipient is then tricked into clicking a malicious link, '
                                  'which can lead to the installation of malware, the freezing of the system as part of a ransomware attack '
                                  'or the revealing of sensitive information.'
                                  'An attack can have devastating results. For individuals, this includes unauthorized purchases, the stealing of funds, or identify theft.')
                            ],
                          )
                        ])),
              ))
            ],
          ),
        ));
  }
}
