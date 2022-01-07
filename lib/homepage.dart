// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_education/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:webviewx/webviewx.dart';

import 'quiz.dart';

class QuizNumber {
  static bool isFirstQuiz = false;
}

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

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: media.width < 600
            ? Drawer(
                child: Menu(),
              )
            : null,

        //BODY
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/home.jpg'),
              ),
            ),
            child: Row(
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
                    flex: 4,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(children: [
                        Center(
                            child: Text(
                          'Cyber Education',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 50,
                              fontFamily: 'Mechanismo'),
                        )),
                        // Most used cyber attacks section
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15, left: 0),
                              child: Text(
                                '"Protect yourself online"',
                                style: TextStyle(
                                  fontFamily: 'Mechanismo',
                                  fontSize: 25,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 60,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Attacks',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: 'Mechanismo'),
                                ))),
                        Align(
                            alignment: Alignment.topLeft,
                            child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                controller: scrollController,
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: AttackButton(
                                          dialogColor: Color(0xFF383838),
                                          buttonColor: Color(0xffbb243c),
                                          heading: Text('Malware attacks'),
                                          image: 'assets/images/ransomware.png',
                                          smallImage:
                                              'assets/images/malware.png',
                                          attackDefinition: Text(
                                              "One of the most used type of malware is Ransomware. Ransomware is a type of malware from cryptovirology that threatens to publish the victim's personal data or perpetually block access to it unless a ransom is paid.\n"),
                                          finalParagraph: Text(
                                              "\nRansomware is often spread through phishing emails that contain malicious attachments or through drive-by downloading. Drive-by downloading occurs when a user unknowingly visits an infected website and then malware is downloaded and installed without the user’s knowledge. Crypto ransomware, a malware variant that encrypts files, is spread through similar methods and has also been spread through social media, such as Web-based instant messaging applications. Additionally, newer methods of ransomware infection have been observed. For example, vulnerable Web servers have been exploited as an entry point to gain access to an organization’s network."),
                                          subtitle: Text(
                                              'Malware usage is up almost 800% since early 2020.\n'),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: AttackButton(
                                            dialogColor: Color(0xFF383838),
                                            buttonColor: Color(0xff144c64),
                                            heading: Text('Phishing'),
                                            image: 'assets/images/amazon.png',
                                            smallImage:
                                                'assets/images/phishing.PNG',
                                            subtitle: Text(
                                                'Phishing attacks are the most common cause of data breaches globally and have'
                                                ' been the root cause of notable instances of cybercrime in the last decade.\n'),
                                            attackDefinition: Text(
                                                'Phishing attacks attempt to steal information from users or trick them into downloading malware by'
                                                'sending malicious emails or text messages (SMS) that look like real requests but are, in fact, a Scam.\n'),
                                            finalParagraph: Text(
                                                '\nIt occurs when an attacker, masquerading as a trusted entity, dupes a victim into opening '
                                                'an email, instant message, or text message. The recipient is then tricked into clicking a malicious link, '
                                                'which can lead to the installation of malware, the freezing of the system as part of a ransomware attack '
                                                'or the revealing of sensitive information.'
                                                'An attack can have devastating results. For individuals, this includes unauthorized purchases, the stealing of funds, or identify theft.'))),
                                    Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: AttackButton(
                                            dialogColor: Color(0xFF383838),
                                            buttonColor: Color(0xff35746c),
                                            heading: Text('DDoS'),
                                            image: 'assets/images/ddos.png',
                                            smallImage:
                                                'assets/images/ddosGood.png',
                                            subtitle: Text(
                                                'DDoS attacks are carried out with networks of Internet-connected machines.\n'
                                                'These networks consist of computers and other devices (such as IoT devices)which have been infected with malware, allowing them to be controlled remotely by an attacker.'),
                                            attackDefinition: Text(
                                                '\nDistributed denial of service (DDoS) attacks disrupt the traffic'
                                                'to a website, application, server, service, or network by overwhelming it with a flood of traffic from compromised computer networks'
                                                '(botnets) that prevents real users from accessing it. In 2018, GitHub experienced the largest DDoS'
                                                'attack ever when it was hit with 1.35 terabits of traffic per second and was offline for almost 20 minutes as a result.'
                                                'DDoS attacks are common and increased by 50% in 2020 compared to 2019, with a large surge occurring in early 2020 during the pandemic, according to security company Kaspersky.\n'),
                                            finalParagraph: Text(
                                                '\nThe most obvious symptom of a DDoS attack is a site or service '
                                                'performance issues, further investigation is usually required. Traffic analytics tools '
                                                'can help you spot some of these telltale signs of a DDoS attack:'
                                                '\n 1. Suspicious amounts of traffic originating from a single IP address or IP range'
                                                '\n 2. A flood of traffic from users who share a single behavioral profile, such as device type, geolocation, or web browser version'
                                                '\n 3. An unexplained surge in requests to a single page or endpoint'
                                                '\n 4. Odd traffic patterns such as spikes at odd hours of the day or patterns that appear to be unnatural (e.g. a spike every 10 minutes)'
                                                '\n 5. There are other, more specific signs of DDoS attack that can vary depending on the type of attack.'))),
                                    Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: AttackButton(
                                            heading: Text('Computer Worm'),
                                            image:
                                                'assets/images/worm_large.png',
                                            smallImage:
                                                'assets/images/worm_small.png',
                                            subtitle: Text(
                                                'A computer worm is a standalone malware computer program that replicates itself in order to spread to other computers.\n'),
                                            attackDefinition: Text(
                                                'It often uses a computer network to spread itself, relying on security failures on the target computer to access it. It will use this machine as a host to scan and infect other computers. When these new worm-invaded computers are controlled,'
                                                ' the worm will continue to scan and infect other computers using these computers as hosts, and this behavior will continue.'
                                                ' Computer worms use recursive methods to copy themselves without host programs and distribute themselves based on the law of exponential growth, thus controlling and infecting more and more computers in a short time.'
                                                ' Worms almost always cause at least some harm to the network, even if only by consuming bandwidth, whereas viruses almost always corrupt or modify files on a targeted computer.'
                                                'Many worms are designed only to spread, and do not attempt to change the systems they pass through. However, as the Morris worm and Mydoom showed, even these "payload-free" worms can cause major'
                                                'disruption by increasing network traffic and other unintended effects.\n'),
                                            finalParagraph: Text(
                                                "\nYou can avoid being infected by a worm using common anti-malware advice. Use antivirus software,"
                                                "keep your computer up to date, and never open links or files which you don't completely trust. "),
                                            buttonColor: Color(0xff88bcbc),
                                            dialogColor: Color(0xFF383838))),
                                    Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: AttackButton(
                                            heading: Text('Brute Force Attack'),
                                            image:
                                                'assets/images/brute_large.png',
                                            smallImage:
                                                'assets/images/brute_small.png',
                                            subtitle: Text(
                                                "A brute force attack uses trial-and-error to guess login info, encryption keys, or find a hidden web page. Hackers work through all possible combinations hoping to guess correctly."),
                                            attackDefinition: Text(
                                                "These attacks are done by ‘brute force’ meaning they use excessive forceful attempts to try and ‘force’ their way into your private account(s)."
                                                "This is an old attack method, but it's"
                                                "still effective and popular with hackers. Because"
                                                "depending on the length and complexity of the password,"
                                                "cracking it can take anywhere from a few seconds to many years."),
                                            finalParagraph: Text(
                                                "How to protect yourself from this attack?"
                                                "\nUse an advanced username and password. "
                                                "Protect yourself with credentials that are stronger "
                                                "than admin and password1234 to keep out these attackers. "
                                                "The stronger this combination is, the harder it will be"
                                                " for anyone to penetrate it."
                                                " \nRemove any unused accounts with high-level permissions. These are the cyber"
                                                "equivalent of doors with weak locks that make breaking in easy."
                                                "Unmaintained accounts are a vulnerability you can’t risk."
                                                "Throw them away as soon as possible. "),
                                            buttonColor: Color(0xffab933c),
                                            dialogColor: Color(0xFF383838))),
                                    SizedBox(
                                      height: 150,
                                    ),
                                  ],
                                ))),

                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Tips',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Mechanismo'),
                                ))),
                        SizedBox(
                          height: 20,
                        ),

                        SingleChildScrollView(
                            physics: BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                          left: 20,
                                        ),
                                        child: CyberTips(
                                          image: 'assets/images/update.png',
                                          backColor: Color(0xFF383c40),
                                          title: 'Up-to-date devices!',
                                          content: 'update_device',
                                          colorTop: Color(0xffdc8665),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                          left: 20,
                                        ),
                                        child: CyberTips(
                                          colorTop: Color(0xff138085),
                                          image: 'assets/images/password.png',
                                          backColor: Color(0xFF383c40),
                                          title: 'Use strong passwords!',
                                          content: 'password',
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                          left: 20,
                                        ),
                                        child: CyberTips(
                                          colorTop: Color(0xff544667),
                                          image: 'assets/images/wifi.png',
                                          backColor: Color(0xFF383c40),
                                          title: 'Public Wi-Fi!',
                                          content: 'wifi',
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                          left: 20,
                                        ),
                                        child: CyberTips(
                                          colorTop: Color(0xffce7672),
                                          image: 'assets/images/backup.png',
                                          backColor: Color(0xFF383c40),
                                          title: 'Back-up Data!',
                                          content: 'backup',
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                          left: 20,
                                        ),
                                        child: CyberTips(
                                          colorTop: Color(0xffeeb462),
                                          image: 'assets/images/family.png',
                                          backColor: Color(0xFF383c40),
                                          title: 'Educate your family!',
                                          content: 'family',
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                          left: 20,
                                        ),
                                        child: CyberTips(
                                          colorTop: Color(0xffccabda),
                                          image: 'assets/images/personal.png',
                                          backColor: Color(0xFF383c40),
                                          title: 'Sharing personal data!',
                                          content: 'personal_information',
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 500,
                          height: 600,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.grey),
                          child: Column(
                            children: [
                              Container(
                                  width: 500,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          spreadRadius: 2,
                                          blurRadius: 3,
                                          offset: Offset(0, 4),
                                        )
                                      ],
                                      color: Colors.white),
                                  child: Column(children: [
                                    Center(
                                      child: Text(
                                        'Useful Resources',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontFamily: 'Mechanismo'),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Image.asset(
                                            'assets/images/book.png'))
                                  ])),
                            ],
                          ),
                        )
                      ]),
                    )),
              ],
            )
            //add old body here
            ));
  }
}

//Custom widget to implement ExpansionTiles
class AttackButton extends StatelessWidget {
  final String smallImage;
  final String image;
  final Text heading;
  final Text subtitle;
  final Text attackDefinition;
  final Color buttonColor;
  final Color dialogColor;

  final Text finalParagraph;

  AttackButton({
    Key? key,
    GlobalKey? moveToWidget,
    required this.heading,
    required this.image,
    required this.smallImage,
    required this.subtitle,
    required this.attackDefinition,
    required this.finalParagraph,
    required this.buttonColor,
    required this.dialogColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: SizedBox(
                width: 250,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: buttonColor,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          smallImage,
                          height: 60,
                          width: 70,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        heading,
                      ],
                    ),
                    onPressed: () {
                      showAnimatedDialog(
                        animationType: DialogTransitionType.scale,
                        curve: Curves.fastOutSlowIn,
                        duration: Duration(seconds: 1),
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: dialogColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            scrollable: true,
                            title: Row(
                              children: [
                                IconButton(
                                  alignment: Alignment.topLeft,
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.deepOrange,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                heading
                              ],
                            ),
                            content: SizedBox(
                                width: 700,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    subtitle,
                                    attackDefinition,
                                    Image.asset(image),
                                    finalParagraph,
                                  ],
                                )),
                            elevation: 50.0,
                          );
                        },
                      );
                    }))));
  }
}

class CyberTips extends StatefulWidget {
  final String image;
  final String content;
  final String title;
  final Color backColor;
  final Color colorTop;

  CyberTips({
    Key? key,
    required this.colorTop,
    required this.image,
    required this.content,
    required this.backColor,
    required this.title,
  }) : super(key: key);

  DocumentReference docRef =
      FirebaseFirestore.instance.collection('content').doc('tips');

  @override
  _CyberTipsState createState() => _CyberTipsState();
}

class _CyberTipsState extends State<CyberTips> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          top: 0,
          left: 0,
        ),
        width: 350,
        height: 650,
        decoration: BoxDecoration(
          border: Border.all(width: 0, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.grey.withOpacity(0.5),
          //       spreadRadius: 4,
          //       blurRadius: 10,
          //       offset: Offset(0, 0)),
          // ],
          color: widget.backColor.withOpacity(0.8),
        ),
        child: Column(
          children: [
            Center(
                child: Container(
                    width: 500,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: widget.colorTop,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 4)),
                      ],
                    ),
                    child: Column(children: [
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          )),
                      Image.asset(
                        widget.image,
                        width: 250,
                        height: 200,
                      ),
                    ]))),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: FutureBuilder<DocumentSnapshot>(
                  future: widget.docRef.get(),
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
                      return Text(
                        data[widget.content],
                        style: TextStyle(fontSize: 20),
                      );
                    }

                    return Text('...');
                  }),
            )
          ],
        ));
  }
}

//Hamburger Menu
class Menu extends StatelessWidget {
  DocumentReference userName = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
            decoration:
                BoxDecoration(color: Color(0xFF383838).withOpacity(0.8)),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
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

                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;

                            return Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 0,
                                  left: 0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                        padding:
                                            EdgeInsets.only(top: 10, left: 10),
                                        child: Text(
                                          "1st score: ${data['score_quiz']}",
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 10),
                                        child: Text(
                                          "2nd score: ${data['score_test']}",
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          }
                          return const Text("...");
                        },
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff6e7f80),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homepage()));
                        }
                      },
                    )),
                ListTile(
                  leading: Icon(Icons.quiz_rounded),
                  title: const Text('Quiz'),
                  onTap: () {
                    // Update the state of the app.
                    showAnimatedDialog(
                      animationType: DialogTransitionType.scale,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(seconds: 1),
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          scrollable: true,
                          title: Row(
                            children: [
                              IconButton(
                                  iconSize: 20,
                                  onPressed: () => Navigator.pop(context),
                                  color: Colors.deepOrange,
                                  icon: Icon(
                                    Icons.arrow_back,
                                  )),
                              Center(
                                  child: TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        'Return',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ))),
                            ],
                          ),
                          content: SizedBox(
                              width: 700,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/stop.png',
                                        width: 80,
                                        height: 60,
                                      ),
                                      Text(
                                        'Rules',
                                        style: TextStyle(
                                            fontSize:
                                                media.width > 600 ? 25 : 20),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'The first 5 questions are testing to see if you have knowledge'
                                        ' about any of the most used cyberattacks in the world.'
                                        ' \nIf your answer is correct, you will get 1 mark\n'
                                        '\nOnline Behaviour Questions '
                                        '\nScale based answers, Strongly Disagree (5 marks) to Strongly Agree (1 mark)'
                                        '\nIf you agree with the behaviour statements you will get less marks'
                                        '\nIf you disagree with the statements, you get more marks\n'
                                        '\nTotal Score of this quiz: 35',
                                        style: TextStyle(
                                          fontSize: media.width > 600 ? 18 : 15,
                                        ),
                                      )),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Center(
                                      child: Text(
                                    'Is this your first quiz?',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: media.width > 600 ? 40 : 20),
                                  )),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Center(
                                      child: SizedBox(
                                          height: media.width > 600 ? 50 : 30,
                                          width: media.width > 600 ? 210 : 100,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.orange)),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Quiz()));

                                                QuizNumber.isFirstQuiz = true;
                                              },
                                              child: Text(
                                                'Yes',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25),
                                              )))),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                      child: SizedBox(
                                    width: media.width > 600 ? 210 : 100,
                                    height: media.width > 600 ? 50 : 30,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xff6e7f80))),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Quiz()));
                                          QuizNumber.isFirstQuiz = false;
                                        },
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25),
                                        )),
                                  ))
                                ],
                              )),
                          elevation: 50.0,
                        );
                      },
                    );
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
            )));
  }
}
