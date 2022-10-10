import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _dialog = 'Default text - some sample text here';
  int _imgIdx = 12;

  void _generateTodayDialog() {
    var currDat = DateTime.now();
    int currYear = currDat.year;
    int currMonth = currDat.month;
    int currDay = currDat.day;
    int idx = 0;

    for (int i = 1; i < currMonth; ++i) {
      switch (i){
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
        idx += 31;
        break;
        case 2:
          if (currYear % 4 == 0) {
            idx += 29;
          } else {
            idx += 28;
          }
          break;
        case 4: case 6: case 9: case 11:
        idx += 30;
        break;
      }
    }
    idx += currDay;
    idx--;

    idx = 0; // TODO

    setState((){
      _dialog = _todayData.elementAt(idx);
    });
  }

  void _generateImage() {
    setState(() {
      if (_imgIdx != 12) {
        _imgIdx++;
      } else {
        _imgIdx = 1;
      }
    });
  }

  void _generateTiredDialog(){
    int randIdx = Random().nextInt(10); //TODO
    setState((){
      _dialog = _tiredData.elementAt(randIdx);
    });
  }

  void _generateNotHappyDialog(){
    int randIdx = Random().nextInt(15); //TODO
    setState((){
      _dialog = _notHappyData.elementAt(randIdx);
    });
  }

  Future<void> _launchUrl() async {
    int randIdx = Random().nextInt(5); //TODO
    final url = Uri.parse(_igLinkData.elementAt(randIdx));
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), //apply padding horizontal or vertical only
              child: Text(
                  _dialog,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20), //apply padding horizontal or vertical only
              child: GestureDetector(
                  onTap: _generateImage,
                  child: Image.asset(
                      '${'images/$_imgIdx'}.jpg',
                      height: MediaQuery.of(context).size.width-40,
                      width:MediaQuery.of(context).size.width-40
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35), //apply padding horizontal or vertical only
              child: SizedBox(
                width:double.infinity,
                child: ElevatedButton(
                  onPressed: _generateTodayDialog,
                  child: const Text('Button 1'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35), //apply padding horizontal or vertical only
              child: SizedBox(
                width:double.infinity,
                child: ElevatedButton(
                  onPressed: _generateTiredDialog,
                  child: const Text('Button 2'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35), //apply padding horizontal or vertical only
              child: SizedBox(
                width:double.infinity,
                child: ElevatedButton(
                  onPressed: _generateNotHappyDialog,
                  child: const Text('Button 3'),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchUrl,
        tooltip: 'ig',
        child: const Icon(Icons.add_reaction_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  final List<String> _todayData = [
    // TODO: 366 sentences in total
    'Button 1 text - some sample text, some sample text, some sample text',
    'Button 1 text - some sample text, some sample text, some sample text2',
    'Button 1 text - some sample text, some sample text, some sample text3',
    'Button 1 text - some sample text, some sample text, some sample text4',
    'Button 1 text - some sample text, some sample text, some sample text5',
    'Button 1 text - some sample text, some sample text, some sample text6',
    'Button 1 text - some sample text, some sample text, some sample text7',
    'Button 1 text - some sample text, some sample text, some sample text8',
    'Button 1 text - some sample text, some sample text, some sample text9',
    'Button 1 text - some sample text, some sample text, some sample text10',
    'Button 1 text - some sample text, some sample text, some sample text11',
  ];

  final List<String> _tiredData = [
    // TODO: 100 sentences in total
    'Button 2 text - some sample text',
    'Button 2 text - some sample text, some sample text2',
    'Button 2 text - some sample text, some sample text3',
    'Button 2 text - some sample text, some sample text4',
    'Button 2 text - some sample text, some sample text5',
    'Button 2 text - some sample text, some sample text6',
    'Button 2 text - some sample text, some sample text7',
    'Button 2 text - some sample text, some sample text8',
    'Button 2 text - some sample text, some sample text9',
    'Button 2 text - some sample text, some sample text10',
  ];

  final List<String> _notHappyData = [
    // TODO: 100 sentences in total
    'Button 3 text - some sample text, some sample text, some sample text',
    'Button 3 text - some sample text, some sample text, some sample text2',
    'Button 3 text - some sample text, some sample text, some sample text3',
    'Button 3 text - some sample text, some sample text, some sample text4',
    'Button 3 text - some sample text, some sample text, some sample text5',
    'Button 3 text - some sample text, some sample text, some sample text6',
    'Button 3 text - some sample text, some sample text, some sample text7',
    'Button 3 text - some sample text, some sample text, some sample text8',
    'Button 3 text - some sample text, some sample text, some sample text9',
    'Button 3 text - some sample text, some sample text, some sample text10',
    'Button 3 text - some sample text, some sample text, some sample text11',
    'Button 3 text - some sample text, some sample text, some sample text12',
    'Button 3 text - some sample text, some sample text, some sample text13',
    'Button 3 text - some sample text, some sample text, some sample text14',
    'Button 3 text - some sample text, some sample text, some sample text15',
  ];

  final List<String> _igLinkData = [
    'https://www.instagram.com/reel/CjUzWebrfCX/?igshid=YmMyMTA2M2Y=',
    'https://www.instagram.com/p/CTzGVCVKe3Z/?igshid=YmMyMTA2M2Y=',
    'https://www.instagram.com/p/CTwbDYdAZiy/?igshid=YmMyMTA2M2Y=',
    'https://www.instagram.com/p/CTiiZILhmeE/?igshid=YmMyMTA2M2Y=',
    'https://www.instagram.com/p/CTrRvQ5AM6b/?igshid=YmMyMTA2M2Y=',
  ];
}