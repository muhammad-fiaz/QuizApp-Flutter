import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/Screens/quiz_create_password.dart';
import 'package:quiz/utils/app_widget.dart';
import 'package:quiz/utils/quiz_colors.dart';
import 'package:quiz/utils/quiz_constant.dart';
import 'package:quiz/utils/quiz_strings.dart';
import 'package:quiz/utils/quiz_widget.dart';

class QuizSignUp extends StatefulWidget {
  static String tag = '/QuizSignUp';

  const QuizSignUp({super.key});

  @override
  _QuizSignUpState createState() => _QuizSignUpState();
}

class _QuizSignUpState extends State<QuizSignUp> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(quizappbackground);

    return Scaffold(
      appBar: AppBar(
        title: text(quizlblcreateaccount, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
        leading:const Icon(
          Icons.arrow_back,
          color: quizcolorPrimary,
          size: 30,
        ).onTap(() {
          Navigator.of(context).pop();
        }),
        centerTitle: true,
        backgroundColor: quizappbackground,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: quizappbackground,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
              const  SizedBox(height: 20),
                text(quizinfosignup, textColor: quiztextColorSecondary, isLongText: true, isCentered: true).center(),
                Container(
                  margin:const EdgeInsets.all(24.0),
                  decoration: boxDecoration(bgColor: quizwhite, color: quizwhite, showShadow: true, radius: 10),
                  child: quizEditTextStyle(quizhintyouremail, isPassword: false),
                ),
               const SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    text(quizlblalreadyhaveanaccount),
                    text(quizlblsignin, textColor: quizcolorPrimary, textAllCaps: true),
                  ],
                ).onTap(() {
                  Navigator.of(context).pop();
                }),
               const SizedBox(height: 20),
                Container(
                  margin:const EdgeInsets.all(24.0),
                  child: quizButton(
                    textContent: quizlblcontinue,
                    onPressed: () {
                      setState(() {
                      const  QuizCreatePassword().launch(context);
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
