import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class GymWorkout extends StatefulWidget {
  const GymWorkout({super.key});

  @override
  State<GymWorkout> createState() => _GymWorkoutState();
}

class _GymWorkoutState extends State<GymWorkout> {
  String? videoID1 = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=sthD8ziGP1c");

  String? videoID2 = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=YvFWg-oUlG8");

  String? videoID3 = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=Im5wJLdudDg&t=18s");

  String? videoID4 = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=yOq-qw2mx4A");

  String? videoID5 = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=2nDt5D1g2GU");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          "Gym Workout Vides",
          style: TextStyle(
              fontSize: 18, fontFamily: 'Montserrat', color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            videoContainers(
                videono: videoID1,
                txt:
                    "If you just joined gym then this video is very useful for you as a beginner."),
            videoContainers(
                videono: videoID2,
                txt:
                    "In this you will learn how to use gym equipments properly."),
            videoContainers(
                videono: videoID3,
                txt:
                    "This video shows how to train your full body muscles in gym."),
            videoContainers(
                videono: videoID4,
                txt:
                    "If you are planning to set perfect routine for your leg day then this video is for you."),
            videoContainers(
                videono: videoID5,
                txt:
                    "This video helps you to set perfect back routine for your gym."),
          ],
        ),
      ),
    );
  }

  videoContainers({String? videono, required String txt}) {
    return Container(
      decoration: BoxDecoration(
       // border: Border.all(color: Colors.purple),
      ),
      child: Card(
        elevation: 20,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Text(
                txt,
                style: TextStyle(
                    fontFamily: 'Montserrat', color: Colors.black, fontSize: 14),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: videono!,
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                    //  showLiveFullscreenButton: true
                  ),
                ),
                showVideoProgressIndicator: true,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
