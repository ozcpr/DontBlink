import 'package:dblink/constants/container.dart';
import 'package:dblink/screens/main/core_area.dart';
import 'package:dblink/screens/main/loading.dart';
import 'package:dblink/screens/main/start_screen.dart';
import 'package:flutter/material.dart';
import "package:word_generator/word_generator.dart";
import 'package:english_words/english_words.dart';
import 'package:dblink/services/word_pulling.dart';
import 'package:dblink/constants/colors.dart';
import 'package:dblink/screens/main/category.dart';


void main() => runApp(MaterialApp(


  initialRoute: '/loading',
  routes: {
    '/loading': (context) => LoadingScreen(),
    '/category': (context) => Category(),
    '/start': (context)=> StartScreen(),
    '/core': (context) => RandomWordsScreen(),
    '/main': (context) => WordList(),
},


));


/*void pullWords() async {
  await WordPulling().pullWords();
}*/




class WordList extends StatefulWidget {
  @override
  State<WordList> createState() => _WordListState();
}

Map <String,String>selectionData = {'category' : 'Name'};

class _WordListState extends State<WordList> {

//TODO : void initState()


  @override
  Widget build(BuildContext context) {

    selectionData = selectionData.isEmpty ? (ModalRoute.of(context)?.settings.arguments as Map<String, String>) : selectionData;

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              WordGenerator().randomName().toString(),
              style: appDefaults().customTheme.textTheme.titleLarge,
            ),
            FloatingActionButton(
                onPressed:() {
                  print(selectionData);
                },


            )]
        ),
      )
      );
  }
}



