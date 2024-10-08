// ignore_for_file: prefer_const_constructors

import 'package:fitness_app/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({Key? key}) : super(key: key);

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  PageController _controller = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: PageView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                //2 is our last page starting from 0
                isLastPage = index == 2;
              });
            },
            children: [
              //One page layout
              BuildIntroPage(
                  img: 'assets/images/gym1.png',
                  title: 'Workout Anywhere',
                  description: 'You can do your Workout at home '
                      'without any equipments, or outside.'),

              BuildIntroPage(
                img: 'assets/images/gym2.png',
                title: 'Learn Techniques',
                description: 'Our workout Programs are  '
                    'made by Professionals.',
              ),

              BuildIntroPage(
                img: 'assets/images/gym3.png',
                title: 'Stay strong and healthy',
                description: 'We want you to fully enjoy the program '
                    'and stay healthy and positive.',
              ),
            ],
          )),
          SizedBox(
            height: 5,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              onDotClicked: (index) {
                _controller.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              effect: ExpandingDotsEffect(
                  activeDotColor: Theme.of(context).primaryColor,
                  dotHeight: 3.0,
                  dotWidth: 3.0,
                  dotColor: Colors.black12),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: 60,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple,
                  shape: CircleBorder(),
                ),
                onPressed: isLastPage
                    ? () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Homepage(),));
                      }
                    : () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                child: Icon(Icons.arrow_forward),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BuildIntroPage extends StatelessWidget {
  String title;
  String img;
  String description;
  BuildIntroPage({
    super.key,
    required this.title,
    required this.description,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Stack(
            children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: Colors.purple.withOpacity(0.6),
              ),
            ),
            Container(
              height: 500,
              margin: EdgeInsets.all(20),
              child: Image.asset(img),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26,color: Colors.purple),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.purple),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
