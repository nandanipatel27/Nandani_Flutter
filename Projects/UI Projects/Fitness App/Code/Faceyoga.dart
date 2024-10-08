import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Faceyoga extends StatefulWidget {
  const Faceyoga({super.key});

  @override
  State<Faceyoga> createState() => _FaceyogaState();
}

class _FaceyogaState extends State<Faceyoga> {
  String? videoID1 = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=ZFEj0cWxw08&list=WL&index=1");

  String? videoID2 = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=4SBoTzwSQB8");

  String? videoID3 = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=9wmASBCZppY");

  String? videoID4 = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=d5lk-pqIaSw");

  
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
          "FaceYoga Vides",
          
          style: TextStyle(
              fontSize: 18, fontFamily: 'Montserrat', color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            videoContainers(videono: videoID1,txt:
                    "This is 7 min Face exercise video to slim your face and burn extra fat from face."),
            videoContainers(videono: videoID2, txt: 'This is perfect everyday face yoga video. it\'s only 8 minutes long.'),
            videoContainers(videono: videoID3, txt: 'If you want to lose your double chin fat then this video is for you.'),
            videoContainers(videono: videoID4, txt: 'This is 9 min Face exercise video to slim your face and reduce double chin.'),
          
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
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
