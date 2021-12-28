// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_print, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'homepage.dart';

class Score {
  static int score = 0;

  static ScrollController scrollController = ScrollController();
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
  double heightQuestions = 40;

  bool _customTileExpanded = false;

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

    return Scaffold(
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
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/quiz_background.jpg'))),
            child: SingleChildScrollView(
                controller: Score.scrollController,
                physics: media.width > 600 && media.height > 400
                    ? NeverScrollableScrollPhysics()
                    : BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: 400,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          child: ExpansionTile(
                            backgroundColor: Color(0xffde956d),
                            collapsedBackgroundColor: Color(0xfff7a579),
                            title: Text(
                              'Rules!',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                            leading: Image.asset('assets/images/stop.png'),
                            subtitle: Text(
                              'Scoring system',
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Icon(_customTileExpanded
                                ? Icons.arrow_drop_down_circle
                                : Icons.arrow_drop_down),
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'The first 5 questions are testing to see if you have knowledge'
                                    ' about any of the most used cyberattacks in the world.'
                                    ' \nIf your answer is correct, you will get 1 mark'
                                    ' \nTotal Score of this quiz: 35'
                                    '\n',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ))
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Questions(
                      'assets/images/malware_quiz.jpeg',
                      '1. What is a malware?',
                      'Designed to damage computers, servers or any other devices',
                      "Used to get user's credentials",
                      "It's used to destroy networks",
                      true,
                      false,
                      false,
                      Color(0xFF383c40),
                      Color(0xff5e517d),
                      1500,
                    ),
                    SizedBox(
                      height: heightQuestions,
                    ),
                    Questions(
                      'assets/images/cyberattack.jpg',
                      '2. What is the most used cyber-attack?',
                      'DDoS',
                      'Ransomware',
                      'Phishing',
                      false,
                      false,
                      true,
                      Color(0xFF383c40),
                      Color(0xffe9755c),
                      2900,
                    ),
                    SizedBox(
                      height: heightQuestions,
                    ),
                    Questions(
                      'assets/images/ransomware_quiz.png',
                      '3. What type of attack is this?',
                      'Phishing',
                      'Ransomware',
                      'Zero-day exploit',
                      false,
                      true,
                      false,
                      Color(0xFF383c40),
                      Color(0xff061f3e),
                      4300,
                    ),
                    SizedBox(
                      height: heightQuestions,
                    ),
                    Questions(
                        'assets/images/phishing_quiz.png',
                        '4. What type of attack is this?',
                        'Man in the middle attack',
                        'SQL Injection',
                        'Phishing',
                        false,
                        false,
                        true,
                        Color(0xFF383c40),
                        Color(0xfff2ad73),
                        5700),
                    SizedBox(
                      height: heightQuestions,
                    ),
                    Questions(
                        'assets/images/ddos_quiz.jpg',
                        '5. What is a DDoS attack?',
                        "Destroys people's internet connections",
                        'Steals private data',
                        'Corrupts or deletes personal files',
                        true,
                        false,
                        false,
                        Color(0xFF383c40),
                        Color(0xffcf857e),
                        7100),
                    SizedBox(
                      height: heightQuestions,
                    ),
                    Questions(
                        'assets/images/ransomware_quiz2.png',
                        '6. What should you do if you get a ransom attack?',
                        "Ignore the threat",
                        'Turn off all the infected systems and get specialist help',
                        'Pay the ransom to get your files back',
                        false,
                        true,
                        false,
                        Color(0xFF383c40),
                        Color(0xff2d6974),
                        8500),
                    SizedBox(
                      height: heightQuestions,
                    ),
                    Questions(
                        'assets/images/worm.png',
                        '7. What is a computer worm?',
                        "Malware that replicates itself to spread to other computers",
                        'Malware that downloads on a computer disguised as a legitimate program',
                        "Injects malicious files into the computer's system files.",
                        true,
                        false,
                        false,
                        Color(0xFF383c40),
                        Color(0xff451e3d),
                        9900),
                    SizedBox(
                      height: heightQuestions,
                    ),
                    Questions(
                        'assets/images/computer_virus.png',
                        '8. What is the best way to defend yourself from computer viruses?',
                        "Update apps, two-factor authentication, use a VPN",
                        'Accept cookies, save all your passwords in one place',
                        'Use similar password on all accounts',
                        true,
                        false,
                        false,
                        Color(0xFF383c40),
                        Color(0xff68b39f),
                        11300),
                    SizedBox(
                      height: heightQuestions,
                    ),
                    Questions(
                        'assets/images/firewall.png',
                        '9. What is a Firewall and why is it used?',
                        "A system that controls incoming and outgoing network traffic",
                        'Study of techniques for secure communication',
                        'Computer program used to prevent, detect, and remove malware',
                        true,
                        false,
                        false,
                        Color(0xFF383c40),
                        Color(0xff6ea2b7),
                        12700),
                    SizedBox(
                      height: heightQuestions,
                    ),
                    Questions(
                        'assets/images/brute_force.jpg',
                        '10. How to prevent a Brute Force Attack',
                        "Install a VPN",
                        'Make your passwords more complex',
                        'Set up a proxy server',
                        false,
                        true,
                        false,
                        Color(0xFF383c40),
                        Color(0xffc59f4e),
                        13800),
                    SizedBox(
                      height: heightQuestions,
                    ),
                    Text(
                      'Online Behaviour Questions',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Scale based answers, Strongly Disagree (5 marks) to Strongly Agree (1 mark)'
                      '\n'
                      '\nIf you agree with the following statements you will get less marks'
                      '\nIf you disagree with the statements, you get more marks',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    OnlineBehaviour(
                      14900,
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
                      16000,
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
                      17100,
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
                      18200,
                      '14. I tend to ignore requests from apps to access my location, files, camera etc.',
                      'Ignoring these requests might be very dangerous'
                          "as many online predators are in a continuous hunt of new people's location and their personal data."
                          'E.g. They can check whether your are home or not and they can schedule a potential robbery',
                      false,
                    ),
                    SizedBox(
                      height: 1100,
                    ),
                    OnlineBehaviour(
                      25000,
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
                        width: 110,
                        height: 60,
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: ElevatedButton(
                                child: Text('Submit'),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.orange)),
                                onPressed: () {
                                  addNewScore();

                                  setState(() {});
                                  showAnimatedDialog(
                                      animationType: DialogTransitionType.scale,
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
                ))));
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

  final double offset;

  final Color colorTop;
  final Color colorBot;

  int score = 0;

  bool questionsAnswered = false;

  Questions(
    this.imagePath,
    this.question,
    this.answer1,
    this.answer2,
    this.answer3,
    this.iscorrectAnswer1,
    this.iscorrectAnswer2,
    this.iscorrectAnswer3,
    this.colorBot,
    this.colorTop,
    this.offset,
  );

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  disableButton() {
    setState(() {
      widget.questionsAnswered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    void scrollPage() {
      Score.scrollController.animateTo(media.height,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    }

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

    return Container(
        width: 500,
        height: media.width >= 600 ? 800 : 300,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0xFFdbe1e4)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: widget.colorBot,
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
                        height: media.width >= 600 ? 500 : 200,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(0, 4)),
                          ],
                          border:
                              Border.all(width: 1, color: Color(0xFFdbe1e4)),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: widget.colorTop,
                        ),
                        child: Column(children: [
                          Text(
                            widget.question,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                            ),
                          ),
                          Image.asset(
                            widget.imagePath,
                            height: 400,
                            width: 500,
                          ),
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
                                  if (widget.iscorrectAnswer1 == true) {
                                    scrollPage();
                                    createSnackBar(
                                        'Correct!', Color(0xFFa4d2ac));
                                    disableButton();
                                    Score.score++;
                                  } else {
                                    scrollPage();
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
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF565462))),
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
                                  if (widget.iscorrectAnswer2 == true) {
                                    scrollPage();
                                    createSnackBar(
                                        'Correct!', Color(0xFFa4d2ac));
                                    disableButton();
                                    Score.score++;
                                  } else {
                                    scrollPage();
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
                                if (widget.iscorrectAnswer3 == true) {
                                  scrollPage();
                                  createSnackBar('Correct!', Color(0xFFa4d2ac));
                                  Score.score++;
                                  disableButton();
                                } else {
                                  scrollPage();
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
        ));
  }
}

//Online Behaviours Quiz
class OnlineBehaviour extends StatefulWidget {
  final String behaviourQuestion;
  final String explanation;
  final bool lastQuestionAnswered;
  final double offset;

  bool buttonTapped = false;

  bool questionsAnswered = false;

  bool isButtonTapped1 = false;
  bool isButtonTapped2 = false;
  bool isButtonTapped3 = false;
  bool isButtonTapped4 = false;
  bool isButtonTapped5 = false;

  OnlineBehaviour(
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
    return Column(
      children: [
        Text(
          widget.behaviourQuestion,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: widget.isButtonTapped1 == false
                            ? MaterialStateProperty.all(Color(0xFF6b7a99))
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
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: widget.isButtonTapped2 == false
                            ? MaterialStateProperty.all(Color(0xFF92a7ba))
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
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: widget.isButtonTapped3 == false
                            ? MaterialStateProperty.all(Color(0xFFb7d1e2))
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
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: widget.isButtonTapped4 == false
                            ? MaterialStateProperty.all(Color(0xFFd7dee4))
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
                    )),
                ElevatedButton(
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
                )))
      ],
    );
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
