import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/Screens/quiz_mobile_verify.dart';
import 'package:quiz/utils/app_widget.dart';
import 'package:quiz/utils/quiz_colors.dart';
import 'package:quiz/utils/quiz_constant.dart';
import 'package:quiz/utils/quiz_strings.dart';
import 'package:quiz/utils/quiz_widget.dart';

class QuizCreatePassword extends StatefulWidget {
  static String tag = '/QuizCreatePassword';

  const QuizCreatePassword({super.key});

  @override
  _QuizCreatePasswordState createState() => _QuizCreatePasswordState();
}

class _QuizCreatePasswordState extends State<QuizCreatePassword> {
  var obscureText = true;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(quizappbackground);

    return Scaffold(
      appBar: AppBar(
        title: text(quizlblCreatepassword, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
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
                text(quizinfocreatepassword, textColor: quiztextColorSecondary, isLongText: true, isCentered: true).paddingOnly(left: 40, right: 40, top: 16),
                const SizedBox(height: 20),
                Container(
                  margin:const EdgeInsets.all(24.0),
                  decoration: boxDecoration(bgColor: quizwhite, color: quizwhite, showShadow: true, radius: 10),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        style:const TextStyle(fontSize: textSizeMedium, fontFamily: fontMedium),
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.fromLTRB(16, 22, 16, 22),
                          border: InputBorder.none,
                          hintText: quizhintyourpassword,
                          labelStyle: primaryTextStyle(size: 20, color: quiztextColorPrimary),
                          suffix: text(obscureText ? "Show" : "Hide", textColor: quiztextColorSecondary, fontSize: textSizeNormal, fontFamily: fontMedium).onTap(() {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          }),
                          //suffixText: (obscureText ? "show" : "hide")
                        ),
                      ),
                    ],
                  ),
                ),
               const SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    text(quizlblalreadyhaveanaccount),
                    text(quizlblsignin, textColor: quizcolorPrimary, textAllCaps: true),
                  ],
                ).onTap(() {
                  finish(context);
                }),
               const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.all(24.0),
                  child: quizButton(
                    textContent: quizlblcontinue,
                    onPressed: () {
                      setState(() {
                       const QuizMobileVerify().launch(context);
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
