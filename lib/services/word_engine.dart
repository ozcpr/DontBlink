import 'dart:async';
import 'package:dblink/models/chosen_category.dart';
import 'package:dblink/models/word_data.dart';
import 'package:dblink/services/word_pulling.dart';


class WordEngine {

  //instances
  late String category2String = ChosenCategory.chosenCategory.toString();


  Future <void> assignListByCategory() async{

    print('assignListByCategory() has been called');




    category2String == '{category: Name}'?
    print('Nothing selected yet') :
    print(category2String);

    //list cleaning before assigning
    WordPulling.categorizedWordList.clear();



    switch (category2String) {
      case '{category: Name}':
        WordPulling.categorizedWordList = WordData.wordCache['randomName'] ?? [];
        print('randomNames has been chosen');
        break;

      case '{category: Verb}':
        WordPulling.categorizedWordList = WordData.wordCache['randomVerb'] ?? [];
        print('randomVerbs has been chosen');
        break;

      case '{category: Noun}':
        WordPulling.categorizedWordList = WordData.wordCache['randomNoun'] ?? [];
        print('randomNouns has been chosen');
        break;

      default:
        WordPulling.categorizedWordList = WordData.wordCache['randomName'] ?? [];
        print('randomNames has been chosen as default because you did not choose anything');
        print(WordPulling.categorizedWordList[0]);
    }


  }

}

class TimerUtils {
  late int duration = 0;
  static int staticCounter = 0;



  static void startTimer({  // convert to a stateless widget
    required duration ,
    required Function(int) onTick,
    required Function() onTimerFinish,
    int interval = 100
  }) {
    int counter = duration;
    Timer.periodic(Duration(milliseconds: interval), (Timer timer) {
      counter--;
      staticCounter = counter;
      if (counter <= 0) {

        timer.cancel();
        onTimerFinish();
      } else {
        onTick(counter);
      }
    });
  }
}
