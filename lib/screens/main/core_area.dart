import 'dart:async';
import 'dart:math';

import 'package:dblink/constants/container.dart';
import 'package:dblink/constants/strings.dart';
import 'package:dblink/main.dart';
import 'package:dblink/models/word_data.dart';
import 'package:dblink/screens/main/start_screen.dart';
import 'package:dblink/services/word_engine.dart';
import 'package:dblink/services/word_pulling.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class RandomWordsScreen extends StatefulWidget {







  @override
  State<RandomWordsScreen> createState() => _RandomWordsScreenState();
}

class _RandomWordsScreenState extends State<RandomWordsScreen> {

  //instances


  Random randomIndex = Random();




  void accessList() async {

    await WordPulling.categorizedWordList.isEmpty ?
    print("wordList is null! in Core Screen") :
    print("wordList is not null in Core Screen");
      staticVariables.word = await WordPulling.categorizedWordList
      [randomIndex.nextInt(WordPulling.categorizedWordList.length)];
      setState(() {   });


  }




  //region Accessing wordList Temporary


/*  void accessToList() async {
    *//*await wordListInst1.pullWords();*//*
    WordPulling.wordList.isEmpty ? print("wordList is null! in Core Screen") : print("wordList is not null in Core Screen");

    setState(() async{

      randomIndex = await WordPulling.random.nextInt(WordPulling.wordList.length);
      word = await WordPulling.wordList[randomIndex];
    } );

  }*/

  //endregion


  @override
  void initState() {

    accessList();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: cdContainer(
              child: Text(
                staticVariables.word, // Replace with actual word
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4.0,
                    ),
                  ],
                  fontSize: 72.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width/3.14,
            height: MediaQuery.of(context).size.height/8,
            right: 3,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(7),
                child: cdContainer(
                  child: Text(
                   TimerUtils.staticCounter.toString(), // Replace with actual time count
                    style: TextStyle(
                      color: HexColor('#2B1746'), //
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                ),
            ),
              ),
          ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(7),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/loading');
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: Icon(
                    Icons.pause,
                    color: Color(0xFF2B1746), //
                    size: 36.0,

                  ),
                ),


              )
            ),
          ),
          Positioned(
            bottom: 24,
            height: MediaQuery.of(context).size.height / 8,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                    TimerUtils.startTimer(duration: 20,
                        onTick: (counter) {
                          setState(() {
                            if(counter % 3 == 0) {
                              accessList();
                            }
                          });
                        },
                        onTimerFinish: () {
                          print('Timer Finished');
                          setState(() {
                            TimerUtils.staticCounter;
                          });

                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.pop(context);
                          });
                        });













                  /*counter = 100;
                  Timer.periodic(const Duration(seconds: 1), (timer) {
                    setState(() {
                      print(timer.tick);
                      counter--;
                      if (counter % 3 == 0) {
                        accessList();
                      }
                    });
                    if (counter == 0) {
                      print('Cancel timer');
                      timer.cancel();
                    }
                  });*/
                },
                child: Text('Next Word'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 40),
                  backgroundColor: Color(0xFF2B1746),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
