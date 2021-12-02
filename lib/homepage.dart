// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_education/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:webviewx/webviewx.dart';

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

  //Controllers
  late WebViewXController webController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
        ),
        drawer: media.width < 600
            ? Drawer(
                child: Menu(),
              )
            : null,

        //BODY
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            media.width > 600
                ? Flexible(
                    child: Menu(),
                    flex: 1,
                  )
                : Container(),
            Flexible(
                fit: FlexFit.loose,
                flex: 3,
                child: Column(
                  children: [
                    Center(
                      child: FutureBuilder<DocumentSnapshot>(
                        future: userName.get(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text("Something went wrong");
                          }

                          if (snapshot.hasData && !snapshot.data!.exists) {
                            return const Text("Document does not exist");
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;

                            return Align(
                              alignment: Alignment.topLeft,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
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
                                            " Quiz Score: ${data['score_quiz']}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, left: 10),
                                          child: Text(
                                            " Test Score: ${data['score_test']}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                          return const Text("Fetching Data..");
                        },
                      ),
                    ),
                    // Most used cyber attacks section
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20, left: 30),
                          child: Text(
                            'Cyber attacks:',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )),
                    Align(
                      alignment: Alignment.topLeft,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            //1st Expansion Tile
                            AttackExpansionTile(
                                title: Text('Malware Attacks'),
                                backgroundColor: Color(0xFF304e60),
                                collapsedColor: Color(0xFF304e60),
                                image: 'images/ransomware.png',
                                smallImage: 'images/malware.png',
                                subtitle: Text(
                                    'Malware usage is up almost 800% since early 2020.'),
                                attackDefinition: Text(
                                    "One of the most used type of malware is Ransomware.\n"
                                    "Ransomware is a type of malware from cryptovirology that threatens to publish the victim's personal data or perpetually block access to it unless a ransom is paid."),
                                finalParagraph: Text(
                                    "Ransomware is often spread through phishing emails that contain malicious attachments or through drive-by downloading. Drive-by downloading occurs when a user unknowingly visits an infected website and then malware is downloaded and installed without the user’s knowledge."
                                    "Crypto ransomware, a malware variant that encrypts files, is spread through similar methods and has also been spread through social media, such as Web-based instant messaging applications."
                                    " Additionally, newer methods of ransomware infection have been observed. For example, vulnerable Web servers have been exploited as an entry point to gain access to an organization’s network.")),

                            //2nd Expansion Tile
                            AttackExpansionTile(
                                title: Text('Phising'),
                                backgroundColor: Color(0xFF565462),
                                collapsedColor: Color(0xFF565462),
                                image: 'images/amazon.png',
                                smallImage: 'images/phishing.png',
                                subtitle: Text(
                                    'Phishing attacks are the most common cause of data breaches globally and have'
                                    ' been the root cause of notable instances of cybercrime in the last decade.'),
                                attackDefinition: Text(
                                    'Phishing attacks attempt to steal information from users or trick them into downloading malware by'
                                    'sending malicious emails or text messages (SMS) that look like real requests but are, in fact, a Scam.\n'),
                                finalParagraph: Text(
                                    'It occurs when an attacker, masquerading as a trusted entity, dupes a victim into opening '
                                    'an email, instant message, or text message. The recipient is then tricked into clicking a malicious link, '
                                    'which can lead to the installation of malware, the freezing of the system as part of a ransomware attack '
                                    'or the revealing of sensitive information.'
                                    'An attack can have devastating results. For individuals, this includes unauthorized purchases, the stealing of funds, or identify theft.')),
                            //3rd Expansion Tile
                            AttackExpansionTile(
                                title: Text(
                                    'Distributed Denial of Service Attacks'),
                                backgroundColor: Color(0xFF84693b),
                                collapsedColor: Color(0xFF84693b),
                                image: 'images/ddos.png',
                                smallImage: 'images/ddosGood.png',
                                subtitle: Text(
                                    'DDoS attacks are carried out with networks of Internet-connected machines.'
                                    'These networks consist of computers and other devices (such as IoT devices)which have been infected with malware, allowing them to be controlled remotely by an attacker.'),
                                attackDefinition: Text(
                                    'Distributed denial of service (DDoS) attacks disrupt the traffic'
                                    ' to a website, application, server, service, or network by overwhelming it with a flood of traffic from compromised computer networks'
                                    ' (botnets) that prevents real users from accessing it. In 2018, GitHub experienced the largest DDoS'
                                    ' attack ever when it was hit with 1.35 terabits of traffic per second and was offline for almost 20 minutes as a result.'
                                    'DDoS attacks are common and increased by 50% in 2020 compared to 2019, with a large surge occurring in early 2020 during the pandemic, according to security company Kaspersky.'),
                                finalParagraph: Text(
                                    'The most obvious symptom of a DDoS attack is a site or service '
                                    'performance issues, further investigation is usually required. Traffic analytics tools '
                                    'can help you spot some of these telltale signs of a DDoS attack:'
                                    '\n 1.Suspicious amounts of traffic originating from a single IP address or IP range'
                                    '\n 2.A flood of traffic from users who share a single behavioral profile, such as device type, geolocation, or web browser version'
                                    '\n 3.An unexplained surge in requests to a single page or endpoint'
                                    '\n 4.Odd traffic patterns such as spikes at odd hours of the day or patterns that appear to be unnatural (e.g. a spike every 10 minutes)'
                                    '\n 5.There are other, more specific signs of DDoS attack that can vary depending on the type of attack.')),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        )
        //add old body here
        );
  }
}

//Custom widget to implement ExpansionTiles

class AttackExpansionTile extends StatelessWidget {
  final Color collapsedColor;
  final Color backgroundColor;
  final String smallImage;
  final String image;
  final Text title;
  final Text subtitle;
  final Text attackDefinition;

  final Text finalParagraph;

  AttackExpansionTile(
      {Key? key,
      required this.title,
      required this.backgroundColor,
      required this.collapsedColor,
      required this.image,
      required this.smallImage,
      required this.subtitle,
      required this.attackDefinition,
      required this.finalParagraph})
      : super(key: key);

  final bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 600,
      child: Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: ExpansionTile(
                  expandedAlignment: Alignment.topCenter,
                  expandedCrossAxisAlignment: CrossAxisAlignment.center,
                  collapsedBackgroundColor: collapsedColor,
                  backgroundColor: backgroundColor,
                  title: title,
                  leading: Image.asset(smallImage),
                  subtitle: subtitle,
                  trailing: Icon(
                    _customTileExpanded
                        ? Icons.arrow_drop_down_circle
                        : Icons.arrow_drop_down,
                  ),
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            attackDefinition,
                            SizedBox(
                              height: 20,
                            ),
                            Image.asset(image),
                            SizedBox(
                              height: 20,
                            ),
                            finalParagraph,
                          ],
                        ))
                  ]))),
    ));
  }
}

//Hamburger Menu
class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey, width: 5),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: ListTile(
                  leading: Icon(Icons.home_filled),
                  title: const Text('Home'),
                  onTap: () {
                    var route = ModalRoute.of(context);
                    var name = route?.settings.name;

                    if (media.width < 600) {
                      Navigator.pop(context);
                    }

                    if (name != null && name != '/') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homepage()));
                    }
                  },
                )),
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ReTest()));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle_rounded),
              title: const Text('Sign Out'),
              onTap: () {
                // Update the state of the app.
                FirebaseAuth.instance.signOut();

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ));
  }
}
