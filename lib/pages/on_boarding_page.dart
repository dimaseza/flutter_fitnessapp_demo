import 'package:fitness_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:fitness_app/shared/theme.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pages = [
    PageViewModel(
      title: "Olahraga Terjadwal",
      body: "Catat jadwal olahraga dan sehatkan\nbadan anda",
      image: Center(
        child: Image.asset(
          "assets/screen1.png",
          height: 175.0,
        ),
      ),
      decoration: PageDecoration(
          pageColor: accentColor2,
          bodyTextStyle: textBlackFont.copyWith(fontSize: 16),
          titleTextStyle: textBlackFont.copyWith(fontSize: 24)),
    ),
    PageViewModel(
      title: "Jenis Olahraga",
      body: "Temukan olahraga yang anda inginkan\ndan lakukan tiap hari",
      image: Center(
        child: Image.asset(
          "assets/screen2.png",
          height: 175.0,
        ),
      ),
      decoration: PageDecoration(
          pageColor: accentColor2,
          bodyTextStyle: textBlackFont.copyWith(fontSize: 16),
          titleTextStyle: textBlackFont.copyWith(fontSize: 24)),
    ),
    PageViewModel(
      title: "Otot Sehat",
      body: "Olahraga dengan rutin membuat otot\nanda sehat dan kuat",
      image: Center(
        child: Image.asset(
          "assets/screen3.png",
          height: 175.0,
        ),
      ),
      decoration: PageDecoration(
          pageColor: accentColor2,
          bodyTextStyle: textBlackFont.copyWith(fontSize: 16),
          titleTextStyle: textBlackFont.copyWith(fontSize: 24)),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        onSkip: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        showSkipButton: true,
        skip: Text(
          "Skip",
          style: textWhiteFont.copyWith(color: Colors.blue),
        ),
        next: Text(
          "Next",
          style: textWhiteFont.copyWith(color: Colors.blue),
        ),
        done: Text(
          "Done",
          style: textWhiteFont.copyWith(color: Colors.blue),
        ),
        dotsDecorator: DotsDecorator(
          size: Size.square(10.0),
          activeSize: Size(20.0, 10.0),
          activeColor: Colors.deepOrange,
          color: Colors.black26,
          spacing: EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
