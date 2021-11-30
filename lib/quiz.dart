// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_print, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';

import 'homepage.dart';

class Score {
  static int score = 0;
  //Continua
  static bool allQuestionsAnswered = false;
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              var route = ModalRoute.of(context);
              var name = route?.settings.name;

              print(name.toString());

              if (name == null) {
                Score.score = 0;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
              }
            },
          ),
          title: const Text('CyberQuiz'),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text('Score: ' + Score.score.toString()),
                Questions(
                  'images/malware_quiz.jpeg',
                  '1. What is a malware?',
                  'Designed to damage computers, servers or any other devices',
                  "Used to get user's credentials",
                  "It's used to destroy networks",
                  true,
                  false,
                  false,
                ),
                SizedBox(
                  height: 150,
                ),
                Questions(
                  'images/cyberattack.jpg',
                  '2. What is the most used cyber-attack?',
                  'DDoS',
                  'Ransomware',
                  'Phishing',
                  false,
                  false,
                  true,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Score.score;
                      });
                      print(Score.score);
                    },
                    child: Text('Submit'))
              ],
            )));
  }
}

class Questions extends StatefulWidget {
  final String imagePath;
  final String question;
  final String answer1;
  final String answer2;
  final String answer3;

  final bool iscorrectAnswer1;
  final bool iscorrectAnswer2;
  final bool iscorrectAnswer3;

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
    void createSnackBar(String text, Color c) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
            alignment: Alignment.center,
            height: 100,
            child: Text(
              text,
              style: TextStyle(fontSize: 30, color: Colors.white),
            )),
        duration: const Duration(milliseconds: 1500),
        width: 500.0,
        backgroundColor: c,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ));
    }

    return Column(
      children: [
        SizedBox(
          width: 600,
          height: 400,
          child: Image.asset(widget.imagePath),
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                widget.question,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                ),
              ),
            )),
        Padding(
            padding: EdgeInsets.only(
              top: 40,
            ),
            child: SizedBox(
              width: 500,
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
                                createSnackBar('Correct!', Color(0xFFa4d2ac));

                                disableButton();

                                Score.score++;
                              } else {
                                createSnackBar(
                                    'Wrong Answer!', Color(0xFFEA4C46));
                              }
                            });
                            print(widget.iscorrectAnswer1);
                          }
                        : null),
              ),
            )),
        Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: SizedBox(
              width: 500,
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
                                createSnackBar('Correct!', Color(0xFFa4d2ac));

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
            width: 500,
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
                              createSnackBar('Correct!', Color(0xFFa4d2ac));
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
          ),
        ),
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
