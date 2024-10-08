import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Stretching extends StatefulWidget {
  const Stretching({super.key});

  @override
  State<Stretching> createState() => _StretchingState();
}

class _StretchingState extends State<Stretching> {
  String? videoID1 = YoutubePlayer.convertUrlToId(
      "https://youtu.be/6FyHoo4Vfxg?si=LoviBd6QMriGGCHG");

  String? videoID2 = YoutubePlayer.convertUrlToId(
      "https://youtu.be/zvZx0b2tKHg?si=FoGRd_-LMgNJWN5Y");

  String? videoID3 = YoutubePlayer.convertUrlToId(
      "https://youtu.be/EvF_Jnf9jwg?si=bbpSeABz7XhpMem6");

  String? videoID4 = YoutubePlayer.convertUrlToId(
      "https://youtu.be/0XBcrjkkwQo?si=Uju30CYnFu8oJEA0");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stretching Vides",
          style: TextStyle(
              fontSize: 18, fontFamily: 'Montserrat', color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            videoContainers(
                videono: videoID1,
                txt:
                    'This is 15 min long Stretching video to relax your Neck, Shoulder and Back.'),
            videoContainers(
                videono: videoID2,
                txt:
                    'If you are doing home workout then first you can do this stretching for 4 minutes to warmup your body.'),
            videoContainers(
                videono: videoID3,
                txt:
                    'If your body feels tired then you can do this 10 min full body stretching.'),
            videoContainers(
                videono: videoID4,
                txt: 'This is 8 minute Stretching video for your upperbody.'),
          ],
        ),
      ),
    );
  }

  videoContainers({String? videono, required String txt}) {
    return Container(
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.purple),
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
