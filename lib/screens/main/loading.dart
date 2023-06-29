import 'package:dblink/models/word_data.dart';
import 'package:dblink/services/word_pulling.dart';
import 'package:flutter/material.dart';
import 'package:dblink/models/video_template.dart';
import 'package:chewie/chewie.dart';

class LoadingScreen extends StatefulWidget {

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  final vid = videoTemplate(videoName: 'perfect_loop.mp4', aspectRatio: 4/3);
  ChewieController? chewcont ;
  WordData wordCacheInst1 = WordData();
  WordPulling wordListInst1 = WordPulling();




  Future<void> videoPrep () async {

    print('videoPrep() has been called');
    chewcont = await vid.getChewie();
    chewcont == null ? print("chewcont is null !")  : setState(() {  } );

  }
  


  void executePulling() async {
    /*await wordListInst1.pullWords();*/
    await wordListInst1.pullWords();


  }


//TODO : Temporary solution for word generation and pulling

  @override
  void initState() {

      executePulling();

      videoPrep();

      Future.delayed(Duration(seconds: 5), () {
        Navigator.pushReplacementNamed(context, '/start');
      });

      super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Customize the background color
      body: Container(
        child: Stack (
          children: [
              Container(
                padding: EdgeInsets.all(24),
                alignment: Alignment.center,
                child: chewcont !=null ?
                Chewie(controller: chewcont!,): Container(),
              ),
          ],
        )
      ),
    );
  }
}


