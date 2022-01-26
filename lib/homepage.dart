// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, must_be_immutable, non_constant_identifier_names, import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_education/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:webviewx/webviewx.dart';
import 'package:url_launcher/url_launcher.dart';

import 'quiz.dart';
import 'content.dart';

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

  int buttonTapTips = 0;

  int buttonTapAttacks = 0;

  var firstName = '';

  bool isNewRouteSameAsCurrent = false;

  //Controllers
  late WebViewXController webController;

  ScrollController scrollController = ScrollController();

  //Cyber Tips keys
  GlobalKey key1 = GlobalKey();
  GlobalKey key2 = GlobalKey();

  GlobalKey key3 = GlobalKey();
  GlobalKey key4 = GlobalKey();
  GlobalKey key5 = GlobalKey();
  GlobalKey key6 = GlobalKey();

  //Attacks Keys
  GlobalKey key1_attack = GlobalKey();

  GlobalKey key2_attack = GlobalKey();
  GlobalKey key3_attack = GlobalKey();
  GlobalKey key4_attack = GlobalKey();
  GlobalKey key5_attack = GlobalKey();

  scroll(GlobalKey pKey) {
    Scrollable.ensureVisible(
      pKey.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      alignment: 0.3,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        appBar: media.width < 600
            ? AppBar(
                title: Text('Home'),
              )
            : null,
        drawer: media.width < 600
            ? Drawer(
                child: Menu(),
              )
            : null,

        //BODY
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.jpg'),
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
                      controller: ScrollController(),
                      child: Column(children: [
                        Center(
                            child: Text(
                          'Cyber Education',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: media.width > 600 ? 50 : 35,
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
                                  fontSize: media.width > 600 ? 25 : 20,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 60,
                        ),
                        media.width > 600
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Container(
                                        width: media.width / 1.2,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            color: Color(0xff6e7f80)
                                                .withOpacity(0.8),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 3,
                                                  offset: Offset(0, 4))
                                            ]),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 20,
                                                      right: 10,
                                                    ),
                                                    child: Text(
                                                      'Attacks',
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'Mechanismo'),
                                                    )),
                                                Icon(Icons.arrow_forward),
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: SingleChildScrollView(
                                                physics: BouncingScrollPhysics(
                                                    parent:
                                                        AlwaysScrollableScrollPhysics()),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        child: AttackButton(
                                                          dialogColor:
                                                              Color(0xFF383838),
                                                          buttonColor:
                                                              Color(0xff35455d),
                                                          heading: Text(
                                                              'Malware attacks'),
                                                          image:
                                                              'assets/images/ransomware.png',
                                                          smallImage:
                                                              'assets/images/malware.png',
                                                          attackDefinition: Text(
                                                              AttacksContent
                                                                  .malware_AD),
                                                          finalParagraph: Text(
                                                              AttacksContent
                                                                  .malware_P),
                                                          subtitle: Text(
                                                              'Malware usage is up almost 800% since early 2020.\n'),
                                                        )),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        child: AttackButton(
                                                            dialogColor: Color(
                                                                0xFF383838),
                                                            buttonColor: Color(
                                                                0xff144c64),
                                                            heading: Text(
                                                                'Phishing'),
                                                            image:
                                                                'assets/images/amazon.png',
                                                            smallImage:
                                                                'assets/images/phishing.PNG',
                                                            subtitle: Text(
                                                                AttacksContent
                                                                    .phishing_S),
                                                            attackDefinition: Text(
                                                                AttacksContent
                                                                    .phishing_AD),
                                                            finalParagraph: Text(
                                                                AttacksContent
                                                                    .phishing_P))),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        child: AttackButton(
                                                            dialogColor: Color(
                                                                0xFF383838),
                                                            buttonColor: Color(
                                                                0xff35746c),
                                                            heading:
                                                                Text('DDoS'),
                                                            image:
                                                                'assets/images/ddos.png',
                                                            smallImage:
                                                                'assets/images/ddosGood.png',
                                                            subtitle: Text(
                                                                AttacksContent
                                                                    .ddos_S),
                                                            attackDefinition: Text(
                                                                AttacksContent
                                                                    .ddos_AD),
                                                            finalParagraph: Text(
                                                                AttacksContent
                                                                    .ddos_P))),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        child: AttackButton(
                                                            heading: Text(
                                                                'Computer Worm'),
                                                            image:
                                                                'assets/images/worm_large.png',
                                                            smallImage:
                                                                'assets/images/worm_small.png',
                                                            subtitle: Text(
                                                                AttacksContent
                                                                    .worm_S),
                                                            attackDefinition: Text(
                                                                AttacksContent
                                                                    .worm_AD),
                                                            finalParagraph: Text(
                                                                AttacksContent
                                                                    .worm_P),
                                                            buttonColor: Color(
                                                                0xff88bcbc),
                                                            dialogColor: Color(
                                                                0xFF383838))),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        child: AttackButton(
                                                            heading: Text(
                                                                'Brute Force Attack'),
                                                            image:
                                                                'assets/images/brute_large.png',
                                                            smallImage:
                                                                'assets/images/brute_small.png',
                                                            subtitle: Text(
                                                                AttacksContent
                                                                    .brute_S),
                                                            attackDefinition: Text(
                                                                AttacksContent
                                                                    .brute_AD),
                                                            finalParagraph: Text(
                                                                AttacksContent
                                                                    .brute_P),
                                                            buttonColor: Color(
                                                                0xffab933c),
                                                            dialogColor: Color(
                                                                0xFF383838))),
                                                    SizedBox(
                                                      height: 150,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ))))
                            : Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Container(
                                        width: media.width / 1.2,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            color: Color(0xff6e7f80)
                                                .withOpacity(0.8),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 3,
                                                  offset: Offset(0, 4))
                                            ]),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 20,
                                                      right: 10,
                                                    ),
                                                    child: Text(
                                                      'Attacks',
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'Mechanismo'),
                                                    )),
                                                Icon(Icons.arrow_forward),
                                              ],
                                            ),
                                            Expanded(
                                                child: PageView(
                                              scrollDirection: Axis.horizontal,
                                              children: <Widget>[
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: AttackButton(
                                                      key: key1_attack,
                                                      dialogColor:
                                                          Color(0xFF383838),
                                                      buttonColor:
                                                          Color(0xff35455d),
                                                      heading: Text(
                                                          'Malware attacks'),
                                                      image:
                                                          'assets/images/ransomware.png',
                                                      smallImage:
                                                          'assets/images/malware.png',
                                                      attackDefinition: Text(
                                                          AttacksContent
                                                              .malware_AD),
                                                      finalParagraph: Text(
                                                          AttacksContent
                                                              .malware_P),
                                                      subtitle: Text(
                                                          AttacksContent
                                                              .malware_S),
                                                    )),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: AttackButton(
                                                        key: key2_attack,
                                                        dialogColor:
                                                            Color(0xFF383838),
                                                        buttonColor:
                                                            Color(0xff144c64),
                                                        heading:
                                                            Text('Phishing'),
                                                        image:
                                                            'assets/images/amazon.png',
                                                        smallImage:
                                                            'assets/images/phishing.PNG',
                                                        subtitle: Text(
                                                            AttacksContent
                                                                .phishing_S),
                                                        attackDefinition: Text(
                                                            AttacksContent
                                                                .phishing_AD),
                                                        finalParagraph: Text(
                                                            AttacksContent
                                                                .phishing_P))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: AttackButton(
                                                        key: key3_attack,
                                                        dialogColor:
                                                            Color(0xFF383838),
                                                        buttonColor:
                                                            Color(0xff35746c),
                                                        heading: Text('DDoS'),
                                                        image:
                                                            'assets/images/ddos.png',
                                                        smallImage:
                                                            'assets/images/ddosGood.png',
                                                        subtitle: Text(
                                                            AttacksContent
                                                                .ddos_S),
                                                        attackDefinition: Text(
                                                            AttacksContent
                                                                .ddos_AD),
                                                        finalParagraph: Text(
                                                            AttacksContent
                                                                .ddos_P))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: AttackButton(
                                                        key: key4_attack,
                                                        heading: Text(
                                                            'Computer Worm'),
                                                        image:
                                                            'assets/images/worm_large.png',
                                                        smallImage:
                                                            'assets/images/worm_small.png',
                                                        subtitle: Text(
                                                            AttacksContent
                                                                .worm_S),
                                                        attackDefinition: Text(
                                                            AttacksContent
                                                                .worm_AD),
                                                        finalParagraph: Text(
                                                            AttacksContent
                                                                .worm_P),
                                                        buttonColor:
                                                            Color(0xff88bcbc),
                                                        dialogColor:
                                                            Color(0xFF383838))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: AttackButton(
                                                        key: key5_attack,
                                                        heading: Text(
                                                            'Brute Force Attack'),
                                                        image:
                                                            'assets/images/brute_large.png',
                                                        smallImage:
                                                            'assets/images/brute_small.png',
                                                        subtitle: Text(
                                                            AttacksContent
                                                                .brute_S),
                                                        attackDefinition: Text(
                                                            AttacksContent
                                                                .brute_AD),
                                                        finalParagraph: Text(
                                                            AttacksContent
                                                                .brute_P),
                                                        buttonColor:
                                                            Color(0xffab933c),
                                                        dialogColor:
                                                            Color(0xFF383838))),
                                              ],
                                            )),
                                          ],
                                        ))),
                              ),
                        SizedBox(
                          height: 30,
                        ),
                        media.width > 600
                            ? Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 3,
                                              offset: Offset(0, 4))
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        color:
                                            Color(0xff6e7f80).withOpacity(0.8)),
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Tips',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25,
                                                        fontFamily:
                                                            'Mechanismo'),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Icon(
                                                          Icons.arrow_forward))
                                                ],
                                              ))),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SingleChildScrollView(
                                          physics: BouncingScrollPhysics(
                                              parent:
                                                  AlwaysScrollableScrollPhysics()),
                                          scrollDirection: Axis.horizontal,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 20,
                                                        left: 20,
                                                      ),
                                                      child: CyberTips(
                                                        image:
                                                            'assets/images/update.png',
                                                        backColor:
                                                            Color(0xFF383c40),
                                                        title:
                                                            'Up-to-date devices!',
                                                        content: TipsContent
                                                            .update_device,
                                                        colorTop:
                                                            Color(0xfffbb35a),
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 20,
                                                        left: 20,
                                                      ),
                                                      child: CyberTips(
                                                        colorTop:
                                                            Color(0xff46edc8),
                                                        image:
                                                            'assets/images/password.png',
                                                        backColor:
                                                            Color(0xFF383c40),
                                                        title:
                                                            'Use strong passwords!',
                                                        content: TipsContent
                                                            .password,
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 20,
                                                        left: 20,
                                                      ),
                                                      child: CyberTips(
                                                        colorTop:
                                                            Color(0xfff9ac82),
                                                        image:
                                                            'assets/images/wifi.png',
                                                        backColor:
                                                            Color(0xFF383c40),
                                                        title: 'Public Wi-Fi!',
                                                        content:
                                                            TipsContent.wifi,
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 20,
                                                        left: 20,
                                                      ),
                                                      child: CyberTips(
                                                        colorTop:
                                                            Color(0xffdbe6eb),
                                                        image:
                                                            'assets/images/backup.png',
                                                        backColor:
                                                            Color(0xFF383c40),
                                                        title: 'Back-up Data!',
                                                        content:
                                                            TipsContent.backup,
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 20,
                                                        left: 20,
                                                      ),
                                                      child: CyberTips(
                                                        colorTop:
                                                            Color(0xfffff99b),
                                                        image:
                                                            'assets/images/family.png',
                                                        backColor:
                                                            Color(0xFF383c40),
                                                        title:
                                                            'Educate your family!',
                                                        content:
                                                            TipsContent.family,
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 20,
                                                        left: 20,
                                                      ),
                                                      child: CyberTips(
                                                        colorTop:
                                                            Color(0xffb0f6ff),
                                                        image:
                                                            'assets/images/personal.png',
                                                        backColor:
                                                            Color(0xFF383c40),
                                                        title:
                                                            'Sharing personal data!',
                                                        content: TipsContent
                                                            .personal_information,
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
                                    ])))
                            :
                            //Optimised for phone users
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Container(
                                      width: media.width / 1.2,
                                      height: 600,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 3,
                                                offset: Offset(0, 4))
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          color: Color(0xff6e7f80)
                                              .withOpacity(0.8)),
                                      child: Column(children: [
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Tips',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 25,
                                                          fontFamily:
                                                              'Mechanismo'),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        child: Icon(Icons
                                                            .arrow_forward))
                                                  ],
                                                ))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Expanded(
                                            child: PageView(
                                          scrollDirection: Axis.horizontal,
                                          children: <Widget>[
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  top: 20,
                                                  left: 0,
                                                ),
                                                child: CyberTips(
                                                  key: key1,
                                                  image:
                                                      'assets/images/update.png',
                                                  backColor: Color(0xFF383c40),
                                                  title: 'Up-to-date devices!',
                                                  content:
                                                      TipsContent.update_device,
                                                  colorTop: Color(0xfffbb35a),
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  top: 20,
                                                  left: 0,
                                                ),
                                                child: CyberTips(
                                                  key: key2,
                                                  colorTop: Color(0xff46edc8),
                                                  image:
                                                      'assets/images/password.png',
                                                  backColor: Color(0xFF383c40),
                                                  title:
                                                      'Use strong passwords!',
                                                  content: TipsContent.password,
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  top: 20,
                                                  left: 0,
                                                ),
                                                child: CyberTips(
                                                  key: key3,
                                                  colorTop: Color(0xfff9ac82),
                                                  image:
                                                      'assets/images/wifi.png',
                                                  backColor: Color(0xFF383c40),
                                                  title: 'Public Wi-Fi!',
                                                  content: TipsContent.wifi,
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  top: 20,
                                                  left: 0,
                                                ),
                                                child: CyberTips(
                                                  key: key4,
                                                  colorTop: Color(0xffdbe6eb),
                                                  image:
                                                      'assets/images/backup.png',
                                                  backColor: Color(0xFF383c40),
                                                  title: 'Back-up Data!',
                                                  content: TipsContent.backup,
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  top: 20,
                                                  left: 0,
                                                ),
                                                child: CyberTips(
                                                  key: key5,
                                                  colorTop: Color(0xfffff99b),
                                                  image:
                                                      'assets/images/family.png',
                                                  backColor: Color(0xFF383c40),
                                                  title: 'Educate your family!',
                                                  content: TipsContent.family,
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  top: 20,
                                                  left: 0,
                                                ),
                                                child: CyberTips(
                                                  key: key6,
                                                  colorTop: Color(0xffb0f6ff),
                                                  image:
                                                      'assets/images/personal.png',
                                                  backColor: Color(0xFF383c40),
                                                  title:
                                                      'Sharing personal data!',
                                                  content: TipsContent
                                                      .personal_information,
                                                )),
                                          ],
                                        ))
                                      ])),
                                ),
                              ),

                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    width:
                                        media.width > 600 ? media.width : 330,
                                    height: media.width > 600 ? 600 : 650,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        color:
                                            Color(0xFF383c40).withOpacity(0.8)),
                                    child: Column(children: [
                                      Container(
                                          width: media.width,
                                          height: 300,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 3,
                                                    offset: Offset(0, 4))
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: Color(0xfffcbf49)),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Resources',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Image.asset(
                                                  'assets/images/book.png'),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      media.width > 600
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            'External Links',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    media.width >
                                                                            600
                                                                        ? 23
                                                                        : 18,
                                                                color: Colors
                                                                    .white,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline),
                                                          ),
                                                        )),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 20,
                                                                left: 20),
                                                        child: Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: InkWell(
                                                              child: Text(
                                                                " * NCSC's Website",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .lightBlue,
                                                                    fontSize:
                                                                        media.width >
                                                                                600
                                                                            ? 20
                                                                            : 15),
                                                              ),
                                                              onTap: () => launch(
                                                                  'https://www.ncsc.gov.uk/'),
                                                            ))),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 20,
                                                                left: 20),
                                                        child: Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: InkWell(
                                                              child: Text(
                                                                  " * Cyber threats 2021",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .lightBlue,
                                                                      fontSize: media.width >
                                                                              600
                                                                          ? 20
                                                                          : 15)),
                                                              onTap: () => launch(
                                                                  'https://umbrella.cisco.com/info/2021-cyber-security-threat-trends-phishing-crypto-top-the-list?utm_medium=search-paid&utm_source=google&utm_campaign=UMB_22Q2_UK_EN_GS_Nonbrand_Threats&utm_term=pgm&utm_content=UMB-FY21-Q4-content-ebook-2021-cyber-security-threat-trends&_bt=531345123570&_bk=top%20cybersecurity%20threats%202021&_bm=p&_bn=g&_bg=122332509075&gclid=Cj0KCQiA8vSOBhCkARIsAGdp6RQwN_Q9sGL9gpJi_L5Ccv2C8wCEf4ENlBaZhzmL6q5YJGHaGBdjqEUaAgFuEALw_wcB'),
                                                            ))),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 20,
                                                                left: 20),
                                                        child: Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: InkWell(
                                                              child: Text(
                                                                  " * Cyber Security Newsletter",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .lightBlue,
                                                                      fontSize: media.width >
                                                                              600
                                                                          ? 20
                                                                          : 15)),
                                                              onTap: () => launch(
                                                                  'https://www.infosecurity-magazine.com/news/'),
                                                            )))
                                                  ],
                                                ),
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 20),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            'Cyber Games',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    media.width >
                                                                            600
                                                                        ? 23
                                                                        : 18,
                                                                color: Colors
                                                                    .white,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20,
                                                                  right: 20),
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: InkWell(
                                                                child: Text(
                                                                    " * Cyber Games UK",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .lightBlue,
                                                                        fontSize: media.width >
                                                                                600
                                                                            ? 20
                                                                            : 15)),
                                                                onTap: () => launch(
                                                                    'https://cybergamesuk.com/'),
                                                              ))),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20,
                                                                  right: 20),
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: InkWell(
                                                                child: Text(
                                                                    " * Craft a Phish",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .lightBlue,
                                                                        fontSize: media.width >
                                                                                600
                                                                            ? 20
                                                                            : 15)),
                                                                onTap: () => launch(
                                                                    'https://phishing.livingsecurity.com/'),
                                                              ))),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20,
                                                                  right: 20),
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: InkWell(
                                                                child: Text(
                                                                    " * Targeted Attack",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .lightBlue,
                                                                        fontSize: media.width >
                                                                                600
                                                                            ? 20
                                                                            : 15)),
                                                                onTap: () => launch(
                                                                    'http://targetedattacks.trendmicro.com/'),
                                                              )))
                                                    ]),
                                              ],
                                            )
                                          //If accessed on phone => display links in a column
                                          : Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        'External Links',
                                                        style: TextStyle(
                                                            fontSize:
                                                                media.width >
                                                                        600
                                                                    ? 23
                                                                    : 18,
                                                            color: Colors.white,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline),
                                                      ),
                                                    )),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 20, left: 20),
                                                    child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: InkWell(
                                                          child: Text(
                                                            " * NCSC's Website",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .lightBlue,
                                                                fontSize:
                                                                    media.width >
                                                                            600
                                                                        ? 20
                                                                        : 15),
                                                          ),
                                                          onTap: () => launch(
                                                              'https://www.ncsc.gov.uk/'),
                                                        ))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 20, left: 20),
                                                    child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: InkWell(
                                                          child: Text(
                                                              " * Cyber threats 2021",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .lightBlue,
                                                                  fontSize:
                                                                      media.width >
                                                                              600
                                                                          ? 20
                                                                          : 15)),
                                                          onTap: () => launch(
                                                              'https://umbrella.cisco.com/info/2021-cyber-security-threat-trends-phishing-crypto-top-the-list?utm_medium=search-paid&utm_source=google&utm_campaign=UMB_22Q2_UK_EN_GS_Nonbrand_Threats&utm_term=pgm&utm_content=UMB-FY21-Q4-content-ebook-2021-cyber-security-threat-trends&_bt=531345123570&_bk=top%20cybersecurity%20threats%202021&_bm=p&_bn=g&_bg=122332509075&gclid=Cj0KCQiA8vSOBhCkARIsAGdp6RQwN_Q9sGL9gpJi_L5Ccv2C8wCEf4ENlBaZhzmL6q5YJGHaGBdjqEUaAgFuEALw_wcB'),
                                                        ))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 20, left: 20),
                                                    child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: InkWell(
                                                          child: Text(
                                                              " * Cyber Security Newsletter",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .lightBlue,
                                                                  fontSize:
                                                                      media.width >
                                                                              600
                                                                          ? 20
                                                                          : 15)),
                                                          onTap: () => launch(
                                                              'https://www.infosecurity-magazine.com/news/'),
                                                        ))),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 20, left: 20),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      'Cyber Games',
                                                      style: TextStyle(
                                                          fontSize:
                                                              media.width > 600
                                                                  ? 23
                                                                  : 18,
                                                          color: Colors.white,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 20, left: 20),
                                                    child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: InkWell(
                                                          child: Text(
                                                              " * Cyber Games UK",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .lightBlue,
                                                                  fontSize:
                                                                      media.width >
                                                                              600
                                                                          ? 20
                                                                          : 15)),
                                                          onTap: () => launch(
                                                              'https://cybergamesuk.com/'),
                                                        ))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 20, left: 20),
                                                    child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: InkWell(
                                                          child: Text(
                                                              " * Craft a Phish",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .lightBlue,
                                                                  fontSize:
                                                                      media.width >
                                                                              600
                                                                          ? 20
                                                                          : 15)),
                                                          onTap: () => launch(
                                                              'https://phishing.livingsecurity.com/'),
                                                        ))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 20, left: 20),
                                                    child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: InkWell(
                                                          child: Text(
                                                              " * Targeted Attack",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .lightBlue,
                                                                  fontSize:
                                                                      media.width >
                                                                              600
                                                                          ? 20
                                                                          : 15)),
                                                          onTap: () => launch(
                                                              'http://targetedattacks.trendmicro.com/'),
                                                        )))
                                              ],
                                            )
                                    ])))),
                        SizedBox(
                          height: 30,
                        ),
                      ]),
                    ),

                    //add old body here
                  )
                ])));
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
    var media = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.only(
          top: 0,
          left: 0,
        ),
        width: media.width > 600 ? 350 : 250,
        height: media.width > 600 ? 650 : 400,
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
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
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
                padding: EdgeInsets.only(left: 10), child: Text(widget.content))
          ],
        ));
  }
}

//Hamburger Menu

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  DocumentReference userName = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
                        future: widget.userName.get(),
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
                                          style: TextStyle(
                                            fontSize:
                                                media.width > 600 ? 18 : 20,
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 10),
                                        child: Text(
                                          "1st score: ${data['score_one']}",
                                          style: TextStyle(
                                            fontSize:
                                                media.width > 600 ? 18 : 16,
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 10),
                                        child: Text(
                                          "2nd score: ${data['score_two']}",
                                          style: TextStyle(
                                            fontSize:
                                                media.width > 600 ? 18 : 16,
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

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Login()),
                        (Route<dynamic> route) => false);
                  },
                ),
              ],
            )));
  }
}
