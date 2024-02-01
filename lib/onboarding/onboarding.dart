
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:light_height_ecomerce_app/presentation/views/app.dart';
import 'package:light_height_ecomerce_app/presentation/views/login.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue,
        body: IntroductionScreen(
          pages: [
            // Page 1
            PageViewModel(
              title: 'A chance to start buying for the new seasons',
              body: 'We are ready to buy your Giftcards',
              image: buildImage('assets/people.png'),
              decoration: getPageDecoration(),
            ),

            PageViewModel(
              title: 'School Items',
              body: 'We have the top items to pick on our store',
              image: buildImage('assets/school1-removebg-preview.png'),
              decoration: getPageDecoration(),
            ),

        
            PageViewModel(
              title: 'Today a reader, tomorrow a leader',
              body: 'Start your journey',
              footer: Text(""),
              image: buildImage('assets/ic_launcher.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: const Text('Read',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 17)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          onSkip: () => goToHome(context),
          next: const Icon(Icons.arrow_forward, color: Colors.white),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => {},
          globalBackgroundColor: Colors.blue,
          skipOrBackFlex: 0,
          nextFlex: 0,
          animationDuration: 500,
        ),
      );
void goToHome(context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) =>  App()),
  );
}


  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 400));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: const Color(0xFFBDBDBD),
        activeColor: Colors.white,
        size: const Size(15, 15),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyTextStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        bodyPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.all(24),
        pageColor: Colors.blue,
      );
}