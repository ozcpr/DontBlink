import 'package:dblink/models/chosen_category.dart';
import 'package:dblink/services/word_engine.dart';
import 'package:word_generator/word_generator.dart';
import 'package:dblink/models/word_data.dart';

class WordPulling {

  // Necessary instances
  WordGenerator wordGenerator = WordGenerator();
  int cacheSize4Cat = 100;
  static List<String> categorizedWordList = [];




// Pulls words from the word generator and stores them in the wordCache
  Future<void> pullWords() async {

    // Cache cleaning before pulling
    WordData.wordCache.clear();

    WordData.wordCache['randomName'] = await List.generate(cacheSize4Cat, (index) => wordGenerator.randomName());
    WordData.wordCache['randomVerb'] = await List.generate(cacheSize4Cat, (index) => wordGenerator.randomVerb());
    WordData.wordCache['randomNoun'] = await List.generate(cacheSize4Cat, (index) => wordGenerator.randomNoun());





    //That took my 4 hours to debug ! so i will keep it to remember

/*
    List<String> randomNames = await wordGenerator.randomNames(100);
    List<String> randomVerbs = await wordGenerator.randomVerbs(100);
    List<String> randomNouns = await wordGenerator.randomNouns(100);*/




  }

/*  void printWordCache() {
    if (wordCacheInst.wordCache.isNotEmpty) {
      *//*print(wordCacheInst.wordCache['randomName']?[10]);*//*
      categorizedWordList = wordCacheInst.wordCache['randomName']!;
      print('printWordCache() has been called');
    } else {
      print('wordCache is empty');
    }
  }*/

/*

  void listAccordToCatSelection (chosenCategoryInst) {
    switch (chosenCategoryInst.chosenCategory) {
      case 'randomName' :
        wordList = wordCacheInst.wordCache['randomName']!;
        break;
      case 'randomVerb' :
        wordList = wordCacheInst.wordCache['randomVerb']!;
        break;
      case 'randomNoun' :
        wordList = wordCacheInst.wordCache['randomNoun']!;
        break;
        default :
          wordList = wordCacheInst.wordCache['randomName']!;
    }
  }


*/

}
