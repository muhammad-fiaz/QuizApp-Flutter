import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/Screens/quiz_dashboard.dart';
import 'package:quiz/Screens/quiz_sign_up.dart';
import 'package:quiz/utils/app_widget.dart';
import 'package:quiz/utils/quiz_colors.dart';
import 'package:quiz/utils/quiz_constant.dart';
import 'package:quiz/utils/quiz_strings.dart';
import 'package:quiz/utils/quiz_widget.dart';

class QuizSignIn extends StatefulWidget {
  static String tag = '/QuizSignIn';

  const QuizSignIn({super.key});

  @override
  _QuizSignInState createState() => _QuizSignInState();
}

class _QuizSignInState extends State<QuizSignIn> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(quizappbackground);

    return Scaffold(
      backgroundColor: quizappbackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: quizappbackground,
            child: Column(
              children: <Widget>[
               const SizedBox(height: 16),
                text(quiztitlelogin, fontSize: textSizeNormal, fontFamily: fontBold),
                text(quizinfologin, textColor: quiztextColorSecondary, isLongText: true, isCentered: true).center(),
                Container(
                  margin:const EdgeInsets.all(24.0),
                  decoration: boxDecoration(bgColor: quizwhite, color: quizwhite, showShadow: true, radius: 10),
                  child: Column(
                    children: <Widget>[
                      quizEditTextStyle(quizhintyouremail, isPassword: false),
                      quizDivider(),
                      quizEditTextStyle(quizhintyourpassword),
                    ],
                  ),
                ),
               const SizedBox(height: 30),
                Column(
                  children: <Widget>[
                    text(quizlbldonthaveanaccount),
                    text(quizlblcreateaccount, textColor: quizcolorPrimary, fontFamily: fontSemibold),
                  ],
                ).onTap(() {
                  setState(() {
                   const QuizSignUp().launch(context);
                  });
                }),
               const SizedBox(
                  height: 10,
                ),
                Container(
                    margin:const EdgeInsets.all(24.0),
                    child: quizButton(
                        textContent: quizlblcontinue,
                        onPressed: () {
                          setState(() {
                           const QuizDashboard().launch(context);
                          });
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
