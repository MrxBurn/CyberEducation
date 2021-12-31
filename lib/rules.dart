// ignore_for_file: prefer_final_fields, prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:cyber_education/quiz.dart';
import 'package:flutter/material.dart';

class QuizNumber {
  static bool isFirstQuiz = false;
}

class Rules extends StatefulWidget {
  Rules({Key? key}) : super(key: key);

  bool _customTileExpanded = false;

  @override
  _RulesState createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rules'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    width: 400,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        backgroundColor: Color(0xffde956d),
                        collapsedBackgroundColor: Color(0xfff7a579),
                        title: Text(
                          'Rules!',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        leading: Image.asset('assets/images/stop.png'),
                        subtitle: Text(
                          'Scoring system',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Icon(widget._customTileExpanded
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
                    ))),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Is this your first quiz?',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange)),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quiz()));
                QuizNumber.isFirstQuiz = true;
              },
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.white, fontSize: 25),
              )),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quiz()));
              },
              child: Text(
                'No',
                style: TextStyle(color: Colors.white, fontSize: 25),
              )),
        ],
      ),
    );
  }
}
