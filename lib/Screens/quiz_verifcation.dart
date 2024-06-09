import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/Screens/repo_screen.dart';
import 'package:quiz/utils/app_widget.dart';
import 'package:quiz/utils/quiz_colors.dart';
import 'package:quiz/utils/quiz_constant.dart';
import 'package:quiz/utils/quiz_strings.dart';
import 'package:quiz/utils/quiz_widget.dart';

class QuizVerification extends StatefulWidget {
  static String tag = '/QuizMobileVerification';

  const QuizVerification({super.key});

  @override
  _QuizVerificationState createState() => _QuizVerificationState();
}

class _QuizVerificationState extends State<QuizVerification> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(quizappbackground);

    return Scaffold(
      appBar: AppBar(
        title: text(quiztitleVerification, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
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
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: quizappbackground,
            child: Column(
              children: <Widget>[
              const  SizedBox(height: 20),
                text(quizinfoVerification, textColor: quiztextColorSecondary, isLongText: true, isCentered: true).center(),
              const  SizedBox(height: 20),
              const  PinEntryTextField(fields: 4, fontSize: textSizeLargeMedium).center(),
               const SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    text(quizlbldidnotreceivecode),
                    text(quizlblResend, textColor: quizcolorPrimary, textAllCaps: true),
                  ],
                ).onTap(() {}),
               const SizedBox(height: 20),
                Container(
                  margin:const EdgeInsets.all(24.0),
                  child: quizButton(
                    textContent: quizlblcontinue,
                    onPressed: () {
                      setState(() {
                       const RepoScreen().launch(context);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
