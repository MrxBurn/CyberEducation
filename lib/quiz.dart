// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_print, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, overridden_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'homepage.dart';

class Score {
  static int score = 0;

  static ScrollController scrollController = ScrollController();
  static bool isQuestionAnswered = false;
}

class Keys {
  static final key1 = GlobalKey();
  static final key2 = GlobalKey();
  static final key3 = GlobalKey();
  static final key4 = GlobalKey();
  static final key5 = GlobalKey();
  static final key6 = GlobalKey();
  static final key7 = GlobalKey();
  static final key8 = GlobalKey();
  static final key9 = GlobalKey();

  static final key10 = GlobalKey();
  static final key11 = GlobalKey();
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //Firebase
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String userID = FirebaseAuth.instance.currentUser!.uid;
  CollectionReference colRef = FirebaseFirestore.instance.collection('users');

  //Variables
  double heightBehaviour = 800;
  double heightQuestions = 600;

  ScrollController scrollController = ScrollController();

  void addNewScore() {
    //add the score after quiz
    colRef.doc(userID).update({
      'score_quiz': Score.score,
    });
  }

  @override
  void initState() {
    super.initState();
    Score.score = 0;
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    scroll() {
      Scrollable.ensureVisible(Keys.key11.currentContext!,
          duration: Duration(seconds: 1));
    }

    return Scaffold(
        floatingActionButton: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => scroll(),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              var route = ModalRoute.of(context);
              var name = route?.settings.name;

              if (name == null) {
                Score.score = 0;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
              }
            },
          ),
          title: const Text('CyberQuiz'),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/background.jpg'))),
            child: ListView(
                addAutomaticKeepAlives: false,
                scrollDirection: Axis.vertical,
                controller: Score.scrollController,
                shrinkWrap: true,
                children: [
                  ListView(
                    scrollDirection: Axis.vertical,
                    controller: Score.scrollController,
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Questions(
                        key: Keys.key1,
                        moveToWidgetKey: Keys.key2,
                        imagePath: 'assets/images/malware_quiz.jpeg',
                        question: '1. What is a malware?',
                        answer1:
                            'Designed to damage computers, servers or any other devices',
                        answer2: "Used to get user's credentials",
                        answer3: "It's used to destroy networks",
                        iscorrectAnswer1: true,
                        iscorrectAnswer2: false,
                        iscorrectAnswer3: false,
                        colorBot: Color(0xFF383c40),
                        colorTop: Color(0xff5e517d),
                      ),
                      SizedBox(
                        height: media.width > 600 ? heightQuestions : 250,
                      ),
                      Questions(
                        key: Keys.key2,
                        moveToWidgetKey: Keys.key3,
                        imagePath: 'assets/images/cyberattack.jpg',
                        question: '2. What is the most used cyber-attack?',
                        answer1: 'DDoS',
                        answer2: 'Ransomware',
                        answer3: 'Phishing',
                        iscorrectAnswer1: false,
                        iscorrectAnswer2: false,
                        iscorrectAnswer3: true,
                        colorBot: Color(0xFF383c40),
                        colorTop: Color(0xffe9755c),
                      ),
                      SizedBox(
                        height: media.width > 600 ? heightQuestions : 250,
                      ),
                      Questions(
                        key: Keys.key3,
                        moveToWidgetKey: Keys.key4,
                        imagePath: 'assets/images/ransomware_quiz.png',
                        question: '3. What type of attack is this?',
                        answer1: 'Phishing',
                        answer2: 'Ransomware',
                        answer3: 'Zero-day exploit',
                        iscorrectAnswer1: false,
                        iscorrectAnswer2: true,
                        iscorrectAnswer3: false,
                        colorBot: Color(0xFF383c40),
                        colorTop: Color(0xff061f3e),
                      ),
                      SizedBox(
                        height: media.width > 600 ? heightQuestions : 250,
                      ),
                      Questions(
                        key: Keys.key4,
                        moveToWidgetKey: Keys.key5,
                        imagePath: 'assets/images/phishing_quiz.png',
                        question: '4. What type of attack is this?',
                        answer1: 'Man in the middle attack',
                        answer2: 'SQL Injection',
                        answer3: 'Phishing',
                        iscorrectAnswer1: false,
                        iscorrectAnswer2: false,
                        iscorrectAnswer3: true,
                        colorBot: Color(0xFF383c40),
                        colorTop: Color(0xfff2ad73),
                      ),
                      SizedBox(
                        height: media.width > 600 ? heightQuestions : 250,
                      ),
                      Questions(
                        key: Keys.key5,
                        moveToWidgetKey: Keys.key6,
                        imagePath: 'assets/images/ddos_quiz.jpg',
                        question: '5. What is a DDoS attack?',
                        answer1: "Destroys people's internet connections",
                        answer2: 'Steals private data',
                        answer3: 'Corrupts or deletes personal files',
                        iscorrectAnswer1: true,
                        iscorrectAnswer2: false,
                        iscorrectAnswer3: false,
                        colorBot: Color(0xFF383c40),
                        colorTop: Color(0xffcf857e),
                      ),
                      SizedBox(
                        height: media.width > 600 ? heightQuestions : 250,
                      ),
                      Questions(
                        key: Keys.key6,
                        moveToWidgetKey: Keys.key7,
                        imagePath: 'assets/images/ransomware_quiz2.png',
                        question: '6. How do you get rid of a ransom attack?',
                        answer1: "Ignore the threat",
                        answer2:
                            'Turn off all the infected systems and get specialist help',
                        answer3: 'Pay the ransom to get your files back',
                        iscorrectAnswer1: false,
                        iscorrectAnswer2: true,
                        iscorrectAnswer3: false,
                        colorBot: Color(0xFF383c40),
                        colorTop: Color(0xff2d6974),
                      ),
                      SizedBox(
                        height: media.width > 600 ? heightQuestions : 250,
                      ),
                      Questions(
                        key: Keys.key7,
                        moveToWidgetKey: Keys.key8,
                        imagePath: 'assets/images/worm.png',
                        question: '7. What is a computer worm?',
                        answer1:
                            "Malware that replicates itself to spread to other computers",
                        answer2:
                            'Malware that downloads on a computer disguised as a legitimate program',
                        answer3:
                            "Injects malicious files into the computer's system files.",
                        iscorrectAnswer1: true,
                        iscorrectAnswer2: false,
                        iscorrectAnswer3: false,
                        colorBot: Color(0xFF383c40),
                        colorTop: Color(0xff451e3d),
                      ),
                      SizedBox(
                        height: media.width > 600 ? heightQuestions : 250,
                      ),
                      Questions(
                        key: Keys.key8,
                        moveToWidgetKey: Keys.key9,
                        imagePath: 'assets/images/computer_virus.png',
                        question:
                            '8. How do you protect yourself from viruses?',
                        answer1:
                            "Update apps, two-factor authentication, use a VPN",
                        answer2:
                            'Accept cookies, save all your passwords in one place',
                        answer3: 'Use similar password on all accounts',
                        iscorrectAnswer1: true,
                        iscorrectAnswer2: false,
                        iscorrectAnswer3: false,
                        colorBot: Color(0xFF383c40),
                        colorTop: Color(0xff68b39f),
                      ),
                      SizedBox(
                        height: media.width > 600 ? heightQuestions : 250,
                      ),
                      Questions(
                        key: Keys.key9,
                        moveToWidgetKey: Keys.key10,
                        imagePath: 'assets/images/firewall.png',
                        question: '9. What is a Firewall and why is it used?',
                        answer1:
                            "A system that controls incoming and outgoing network traffic",
                        answer2: 'Study of techniques for secure communication',
                        answer3:
                            'Computer program used to prevent, detect, and remove malware',
                        iscorrectAnswer1: true,
                        iscorrectAnswer2: false,
                        iscorrectAnswer3: false,
                        colorBot: Color(0xFF383c40),
                        colorTop: Color(0xff6ea2b7),
                      ),
                      SizedBox(
                        height: media.width > 600 ? heightQuestions : 250,
                      ),
                      Questions(
                        key: Keys.key10,
                        moveToWidgetKey: Keys.key11,
                        imagePath: 'assets/images/brute_force.jpg',
                        question: '10. How to prevent a Brute Force Attack?',
                        answer1: "Install a VPN",
                        answer2: 'Make your passwords more complex',
                        answer3: 'Set up a proxy server',
                        iscorrectAnswer1: false,
                        iscorrectAnswer2: true,
                        iscorrectAnswer3: false,
                        colorBot: Color(0xFF383c40),
                        colorTop: Color(0xffc59f4e),
                      ),
                      SizedBox(
                        height: media.width > 600 ? heightQuestions : 40,
                      ),
                      Container(
                          width: 600,
                          height: 250,
                          decoration: BoxDecoration(
                              color: Color(0xff130d6f),
                              border: Border.all(
                                  width: 1, color: Color(0xFFdbe1e4)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                              child: Text(
                            'Online Behaviour Questions',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                            ),
                          ))),
                      SizedBox(
                        height: 50,
                      ),
                      OnlineBehaviour(
                        Color(0xff6cac9c),
                        media.height * 10.7,
                        '11. I tend to use similar passwords for multiple accounts',
                        'Using the same password accross all online accounts, users give '
                            'hackers easy access to their whole digital life. It is like leaving '
                            'the keys under the doormat. If a hacker gains access to one user account,'
                            ' he or she can easily take over all online account and impersonate them',
                        false,
                      ),
                      SizedBox(
                        height: heightBehaviour,
                      ),
                      OnlineBehaviour(
                        Color(0xff384d78),
                        media.height * 11.5,
                        '12. I like posting stuff on social media to socialise with my friends',
                        'While it may seem like'
                            'the information is being share with your friends and family,'
                            'it can also be share with hackers and scammers who troll the social media sites',
                        false,
                      ),
                      SizedBox(
                        height: heightBehaviour,
                      ),
                      OnlineBehaviour(
                        Color(0xffe36b77),
                        media.height * 12,
                        '13. I have a lot of accounts, thus I am using a notebook to write them down',
                        'Anyone can take your notebook '
                            'and access all of your personal data including bank account credentials'
                            '.There are many programs out there that act as a safe "journal for passwords"',
                        false,
                      ),
                      SizedBox(
                        height: heightBehaviour,
                      ),
                      OnlineBehaviour(
                        Color(0xff023047),
                        media.height * 13,
                        '14. I tend to accept requests from apps to access my location, files, camera etc.',
                        'Ignoring these requests might be very dangerous'
                            "as many online predators are in a continuous hunt of new people's location and their personal data."
                            'E.g. They can check whether your are home or not and they can schedule a potential robbery',
                        false,
                      ),
                      SizedBox(
                        height: 1100,
                      ),
                      OnlineBehaviour(
                        Color(0xfffc9e00),
                        media.height * 13.2,
                        '15. I accept all terms & conditions of all apps/websites without reading them',
                        'All of us are guilty for this one because a lot of websites/apps have loads of pages '
                            'talking about their conditions when accessing their services. If you ignore these they might'
                            'use the data stored on you in bad ways such as selling it to other '
                            'dodgy companies who might use your data in malicious ways',
                        true,
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                          key: Keys.key11,
                          width: 110,
                          height: 60,
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              child: ElevatedButton(
                                  child: Text('Submit'),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.orange)),
                                  onPressed: () {
                                    addNewScore();

                                    setState(() {});
                                    showAnimatedDialog(
                                        animationType:
                                            DialogTransitionType.scale,
                                        curve: Curves.fastOutSlowIn,
                                        duration: Duration(seconds: 1),
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Well done!'),
                                            content: Text('Score: ' +
                                                Score.score.toString() +
                                                ' /35'),
                                            elevation: 24.0,
                                            shape: RoundedRectangleBorder(),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Homepage()));
                                                  },
                                                  child: Text('OK'))
                                            ],
                                          );
                                        });
                                  }))),
                      SizedBox(
                        height: 300,
                      ),
                    ],
                  )
                ])));
  }
}

//Cyber attack related quiz
class Questions extends StatefulWidget {
  final String imagePath;
  final String question;
  final String answer1;
  final String answer2;
  final String answer3;

  final bool iscorrectAnswer1;
  final bool iscorrectAnswer2;
  final bool iscorrectAnswer3;

  final GlobalKey moveToWidgetKey;

  final Color colorTop;
  final Color colorBot;

  int score = 0;

  bool questionsAnswered = false;

  Questions({
    Key? key,
    required this.moveToWidgetKey,
    required this.imagePath,
    required this.question,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.iscorrectAnswer1,
    required this.iscorrectAnswer2,
    required this.iscorrectAnswer3,
    required this.colorBot,
    required this.colorTop,
  }) : super(key: key);

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  disableButton() {
    setState(() {
      widget.questionsAnswered = true;
    });
  }

  scroll() {
    Scrollable.ensureVisible(
      widget.moveToWidgetKey.currentContext!,
      duration: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    void createSnackBar(String text, Color c) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
            alignment: Alignment.center,
            height: media.width > 600 ? 100 : 50,
            child: Text(
              text,
              style: TextStyle(fontSize: 30, color: Colors.white),
            )),
        duration: const Duration(milliseconds: 4000),
        width: 500.0,
        backgroundColor: c,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ));
    }

    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            width: 500,
            height: media.width > 600 ? 800 : media.height,
            decoration: BoxDecoration(
              border: Border.all(width: 0, color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: widget.colorBot.withOpacity(0.8),
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: 0,
                        ),
                        child: Container(
                            width: 700,
                            height: media.width >= 600 ? 500 : 350,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(0, 4)),
                              ],
                              border: Border.all(width: 0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: widget.colorTop,
                            ),
                            child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Center(
                                      child: Text(
                                    widget.question,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: media.width > 600 ? 25 : 20,
                                    ),
                                  ))),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Image.asset(
                                  widget.imagePath,
                                  height: media.width > 600 ? 300 : 250,
                                  width: media.width > 600 ? 400 : 300,
                                ),
                              )
                            ])))),
                Padding(
                    padding: EdgeInsets.only(
                      top: 40,
                    ),
                    child: SizedBox(
                      width: 300,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Color(0xFF304e60),
                              ),
                            ),
                            child: Text(
                              widget.answer1,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            onPressed: widget.questionsAnswered == false
                                ? () {
                                    setState(() {
                                      scroll();

                                      //If 1st question is correct
                                      //Display SnackBar
                                      //Add 1 to the score
                                      if (widget.iscorrectAnswer1 == true) {
                                        createSnackBar(
                                            'Correct!', Color(0xFFa4d2ac));
                                        disableButton();
                                        Score.score++;
                                      } else {
                                        disableButton();
                                        createSnackBar(
                                            'Wrong Answer!', Color(0xFFEA4C46));
                                      }
                                    });
                                  }
                                : null),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: SizedBox(
                      width: 300,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF565462))),
                            child: Text(
                              widget.answer2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            onPressed: widget.questionsAnswered == false
                                ? () {
                                    setState(() {
                                      scroll();
                                      if (widget.iscorrectAnswer2 == true) {
                                        createSnackBar(
                                            'Correct!', Color(0xFFa4d2ac));
                                        disableButton();
                                        Score.score++;
                                      } else {
                                        disableButton();
                                        createSnackBar(
                                            'Wrong answer!', Color(0xFFEA4C46));
                                      }
                                    });
                                  }
                                : null),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: SizedBox(
                    width: 300,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFF84693b))),
                          child: Text(
                            widget.answer3,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: widget.questionsAnswered == false
                              ? () {
                                  setState(() {
                                    scroll();
                                    if (widget.iscorrectAnswer3 == true) {
                                      createSnackBar(
                                          'Correct!', Color(0xFFa4d2ac));
                                      Score.score++;
                                      disableButton();
                                    } else {
                                      disableButton();
                                      createSnackBar(
                                          'Wrong Answer!', Color(0xFFEA4C46));
                                    }
                                  });
                                }
                              : null),
                    ),
                  ),
                ),
              ],
            )));
  }
}

//Online Behaviours Quiz
class OnlineBehaviour extends StatefulWidget {
  final String behaviourQuestion;
  final String explanation;
  final bool lastQuestionAnswered;
  final double offset;
  final Color backColor;

  bool buttonTapped = false;

  bool questionsAnswered = false;

  bool isButtonTapped1 = false;
  bool isButtonTapped2 = false;
  bool isButtonTapped3 = false;
  bool isButtonTapped4 = false;
  bool isButtonTapped5 = false;

  OnlineBehaviour(
    this.backColor,
    this.offset,
    this.behaviourQuestion,
    this.explanation,
    this.lastQuestionAnswered,
  );

  @override
  _OnlineBehaviourState createState() => _OnlineBehaviourState();
}

class _OnlineBehaviourState extends State<OnlineBehaviour> {
  disableButton() {
    setState(() {
      widget.questionsAnswered = true;
    });
  }

  void scrollPage() {
    Score.scrollController.animateTo(widget.offset,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
        width: 800,
        decoration: BoxDecoration(
            color: widget.backColor,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(width: 1, color: Color(0xFFdbe1e4))),
        child: Column(
          children: [
            Center(
                child: Text(
              widget.behaviourQuestion,
              style: TextStyle(
                  fontSize: media.width > 600 ? 25 : 19, color: Colors.white),
            )),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: widget.isButtonTapped1 == false
                                    ? MaterialStateProperty.all(
                                        Color(0xFF6b7a99))
                                    : MaterialStateProperty.all(
                                        Color.fromARGB(255, 93, 177, 90))),
                            onPressed: widget.questionsAnswered == false
                                ? () {
                                    setState(() {
                                      widget.isButtonTapped1 = true;
                                      Score.score += 5;
                                      disableButton();
                                      widget.buttonTapped = true;
                                      scrollPage();
                                    });
                                    if (widget.buttonTapped == true) {
                                      disableButton();
                                      scrollPage();
                                    }
                                  }
                                : null,
                            child: Text(
                              'Strongly Disagree',
                              style: TextStyle(
                                color: Color(0xFFe5e0e4),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ))),
                    SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: widget.isButtonTapped2 == false
                                    ? MaterialStateProperty.all(
                                        Color(0xFF92a7ba))
                                    : MaterialStateProperty.all(
                                        Color.fromARGB(255, 93, 177, 90))),
                            onPressed: widget.questionsAnswered == false
                                ? () {
                                    setState(() {
                                      widget.isButtonTapped2 = true;
                                      Score.score += 4;
                                      disableButton();
                                      widget.buttonTapped = true;
                                      scrollPage();
                                    });

                                    if (widget.buttonTapped == true) {
                                      disableButton();
                                      scrollPage();
                                    }
                                  }
                                : null,
                            child: Text(
                              'Disagree',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ))),
                    SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: widget.isButtonTapped3 == false
                                    ? MaterialStateProperty.all(
                                        Color(0xFFb7d1e2))
                                    : MaterialStateProperty.all(
                                        Color.fromARGB(255, 93, 177, 90))),
                            onPressed: widget.questionsAnswered == false
                                ? () {
                                    setState(() {
                                      widget.isButtonTapped3 = true;
                                      Score.score += 3;
                                      disableButton();
                                      widget.buttonTapped = true;
                                      scrollPage();
                                    });
                                    if (widget.buttonTapped == true) {
                                      disableButton();
                                      scrollPage();
                                    }
                                  }
                                : null,
                            child: Text(
                              'Neither agree or disagree',
                              style: TextStyle(
                                color: Color.fromARGB(255, 88, 88, 88),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ))),
                    SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: widget.isButtonTapped4 == false
                                    ? MaterialStateProperty.all(
                                        Color(0xFFd7dee4))
                                    : MaterialStateProperty.all(
                                        Color.fromARGB(255, 93, 177, 90))),
                            onPressed: widget.questionsAnswered == false
                                ? () {
                                    setState(() {
                                      widget.isButtonTapped4 = true;
                                      Score.score += 2;
                                      disableButton();
                                      widget.buttonTapped = true;
                                      scrollPage();
                                    });
                                    if (widget.buttonTapped == true) {
                                      disableButton();
                                      scrollPage();
                                    }
                                  }
                                : null,
                            child: Text(
                              'Agree',
                              style: TextStyle(
                                color: Color.fromARGB(255, 78, 78, 78),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ))),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: widget.isButtonTapped5 == false
                                  ? MaterialStateProperty.all(Color(0xFFe8ecef))
                                  : MaterialStateProperty.all(
                                      Color.fromARGB(255, 93, 177, 90))),
                          onPressed: widget.questionsAnswered == false
                              ? () {
                                  setState(() {
                                    widget.isButtonTapped5 = true;
                                    Score.score += 1;
                                    disableButton();
                                    widget.buttonTapped = true;
                                    scrollPage();
                                  });
                                  if (widget.buttonTapped == true) {
                                    disableButton();
                                    scrollPage();
                                  }
                                }
                              : null,
                          child: Text(
                            'Strongly Agree',
                            style: TextStyle(
                              color: Color(0xFF45687b),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    )
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Center(
                child: SizedBox(
                    width: 600,
                    child: Text(
                      'Why is it a bad behaviour?',
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ))),
            SizedBox(
              height: 10,
            ),
            Center(
                child: SizedBox(
                    width: 600,
                    child: Text(
                      widget.explanation,
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ))),
            SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}





//Code to embed websites if necessary
/*WebViewAware(
            child: WebViewX(
                height: 1000,
                width: 1000,
                initialContent: '<h2> Hello, world! </h2>',
                initialSourceType: SourceType.html,
                onWebViewCreated: (controller) {
                  webController = controller;

                  webController.loadContent(
                      'https://en.wikipedia.org/wiki/National_Cyber_Security_Centre_(United_Kingdom)',
                      SourceType.url);
                })));*/
