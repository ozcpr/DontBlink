import 'package:dblink/constants/strings.dart';
import 'package:dblink/main.dart';
import 'package:dblink/screens/main/core_area.dart';
import 'package:dblink/services/word_engine.dart';
import 'package:dblink/services/word_pulling.dart';
import 'package:flutter/material.dart';
import 'package:dblink/models/chosen_category.dart';
import 'package:dblink/models/video_template.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:hexcolor/hexcolor.dart';







class StartScreen extends StatefulWidget {



  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  //instances








//region VideoPlayer       // First way was better in aspect of null safety and readability tbh but i cant remember the first way :DD

  final vid = videoTemplate(videoName: 'start_recursive.mp4', aspectRatio: 9.5/19.5);
  ChewieController? chewcont ;

  Future<void> videoPrep () async {

    print('videoPrep() has been called');

    chewcont = await vid.getChewie();
    chewcont == null ? print("chewcont is null !")  : setState(() { } );

  }

//endregion //

  void executeEngine() async {

    await WordEngine().assignListByCategory();

   setState(() { });
  }


  @override
  initState() {

    videoPrep();
    executeEngine();


    super.initState();
  }

 /* @override
  void dispose() {
                            // This code looks unnecessary bc the widget will be disposed // TODO : After i pressed the start button in the StartScreen
    vidcont?.dispose();
    chewcont?.dispose();

    print("Video Player Disposed");

    super.dispose();
  }*/


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Stack(
          children :[
           Positioned.fill(
             child: FittedBox(
               fit: BoxFit.fitHeight,
               child: chewcont !=null ?
                 Chewie(controller: chewcont!,): Container(),

               // If you don't use the null checking at there,
               // it would throw " ! used on a null value " error
               // but that's why you should transfer to the loading screen

             ),
           ),
          Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ElevatedButton(
                          child: Text('START'),
                          onPressed: () {
                            setState(() {
                              Navigator.pushNamed(context, '/core');
                            });
                            // TODO: redundant code also learn more about dispose method and when to use it
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              HexColor('#E95E69'),
                            ),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              // materialStateProperty is a property that changes based on the state of the button
                              EdgeInsets.symmetric(
                                  horizontal: 32.0, vertical: 16.0),
                            ),
                            textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          )),
                      SizedBox(height: 15.0),
                      Text(
                        'Press to Play',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom:20.0),
                    child: ElevatedButton(
                      child: Text('Select Category'),
                      onPressed: () async {
                        ChosenCategory.chosenCategory = await Navigator.pushNamed(context, '/category');
                        ChosenCategory.setCategory(ChosenCategory.chosenCategory);
                        /*print(ChosenCategory.getCategory());*/
                        setState(() {
                          executeEngine();
                        });

                      },
                      style: ButtonStyle(

                        backgroundColor: MaterialStateProperty.all<Color>(
                          HexColor('#2B1746'),
                        ),overlayColor: MaterialStateProperty.all<Color>(
                        HexColor('#541C74'),
                      ),



                        )
                      ),
                    ),
                  ),
                ),
            ],
          )],
        ),
      ),

    );
  }
}







