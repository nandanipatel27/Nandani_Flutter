import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeWorkout extends StatefulWidget {
  const HomeWorkout({super.key});

  @override
  State<HomeWorkout> createState() => _HomeWorkoutState();
}

class _HomeWorkoutState extends State<HomeWorkout> {
  String? videoID1 = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=QhKMQlvzy00");

  String? videoID2 = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=G16eeqO2U7g");

  String? videoID3 = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=ohgLmY19jNg");

  String? videoID4 = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=iZPjHyWhoDw");

  String? videoID5 = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=nO3fVMzvDrs");

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
          "Home Workout Vides",
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
                    "This is 10 min Low impact Cardio workout. You can do it while seating or standing."),
            videoContainers(
                videono: videoID2,
                txt:
                    "This is 14 days Workout challenge video. that you can do it without any equipment at home."),
            videoContainers(
                videono: videoID3,
                txt:
                    "This is only 5 minute workout video. which u can do for 7 days to see changes."),
            videoContainers(
                videono: videoID4,
                txt:
                    "This video is for lose your stubborn lower belly fat. you can continue this for 10 days to see satisfied changes."),
            videoContainers(
                videono: videoID5,
                txt:
                    "In this video you will learn exercises for flat your stomach in one week."),
          ],
        ),
      ),
    );
  }

  videoContainers({String? videono, required String txt}) {
    return Container(
      decoration: BoxDecoration(
     //   border: Border.all(color: Colors.purple),
        
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
