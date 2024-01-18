import 'package:flutter/material.dart';
import 'package:quiz/Screens/QuizSignIn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/utils/AppWidget.dart';

import '../onBoardingScreens/view/onBoardingScreen.dart';

class QuizSplashScreen extends StatefulWidget {
  @override
  _QuizSplashScreenState createState() => _QuizSplashScreenState();
}

class _QuizSplashScreenState extends State<QuizSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    // Add logic to check if onboarding is complete
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboardingComplete = prefs.getBool('onboarding_complete') ?? false;

    if (onboardingComplete) {
      await 3.seconds.delay.then((value) => push(QuizSignIn(), pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true));
    } else {
      await 3.seconds.delay.then((value) => push(onBoardingScreenHome(), pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true));
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            commonCacheImageWidget("images/quiz/ic_background.png", height: 250, width: 250),
          ],
        ).withWidth(context.width()),
      ),
    );
  }
}
