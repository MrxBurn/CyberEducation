import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late WebViewXController webController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('CyberQuiz'),
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
