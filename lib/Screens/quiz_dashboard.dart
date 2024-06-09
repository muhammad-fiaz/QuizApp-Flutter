import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz/Screens/quiz_all_list.dart';
import 'package:quiz/Screens/quiz_home.dart';
import 'package:quiz/Screens/quiz_profile.dart';
import 'package:quiz/utils/app_widget.dart';
import 'package:quiz/utils/quiz_colors.dart';
import 'package:quiz/utils/quiz_images.dart';

class QuizDashboard extends StatefulWidget {
  static String tag = '/QuizDashboard';

  const QuizDashboard({super.key});

  @override
  _QuizDashboardState createState() => _QuizDashboardState();
}

class _QuizDashboardState extends State<QuizDashboard> {
  var selectedIndex = 0;

  var pages = [
   const QuizHome(),
    const QuizAllList(),
   const QuizProfile(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
      } else if (selectedIndex == 1) {
      } else if (selectedIndex == 2) {}
    });
  }

  Widget quizItem(var pos, var icon, var title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _onItemTapped(pos);
        });
      },
      child: Container(
        height: 55,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              icon,
              width: 20,
              height: 20,
              color: selectedIndex == pos ? quizcolorPrimary : quiziconcolor,
            ),
            text(
              title,
              textColor: selectedIndex == pos ? quizcolorPrimary : quiziconcolor,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(quizappbackground);
    return Scaffold(
      backgroundColor: quizappbackground,
      body: SafeArea(
        child: pages[selectedIndex],
      ),
      bottomNavigationBar: Container(
        //padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: quizwhite,
          border: Border.all(
            color: quizShadowColor,
          ),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),          boxShadow: const [
            BoxShadow(
              color: quizShadowColor,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 3.0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              quizItem(0, quizichomes, "Home"),
              quizItem(1, quizicquiz, "Quiz"),
              quizItem(2, quizicuser, "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
