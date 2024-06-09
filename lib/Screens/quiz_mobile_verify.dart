import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/Screens/quiz_dashboard.dart';
import 'package:quiz/Screens/quiz_verifcation.dart';
import 'package:quiz/utils/app_widget.dart';
import 'package:quiz/utils/quiz_colors.dart';
import 'package:quiz/utils/quiz_constant.dart';
import 'package:quiz/utils/quiz_strings.dart';
import 'package:quiz/utils/quiz_widget.dart';
import 'package:quiz/utils/codePicker/country_code_picker.dart';

class QuizMobileVerify extends StatefulWidget {
  static String tag = '/QuizMobileVerify';

  const QuizMobileVerify({super.key});

  @override
  _QuizMobileVerifyState createState() => _QuizMobileVerifyState();
}

class _QuizMobileVerifyState extends State<QuizMobileVerify> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(quizappbackground);

    return Scaffold(
      appBar: AppBar(
        title: text(quizlblletstarted, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
        leading:const Icon(
          Icons.arrow_back,
          color: quizcolorPrimary,
          size: 30,
        ).onTap(() {
          Navigator.of(context).pop();
        }),
        actions: <Widget>[
          Padding(
              padding:const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                    const  QuizDashboard().launch(context);
                    });
                  },
                  child: text(quizlblskip, textColor: quiztextColorSecondary, fontSize: textSizeMedium, fontFamily: fontMedium).center())),
        ],
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
               const SizedBox(height: 20),
                text(quizinfoletstarted, textColor: quiztextColorSecondary, isLongText: true, isCentered: true).center(),
               const SizedBox(height: 20),
                Container(
                  margin:const EdgeInsets.all(24.0),
                  decoration: boxDecoration(bgColor: quizwhite, color: quizwhite, showShadow: true, radius: 10),
                  child: Row(
                    children: <Widget>[
                    const  SizedBox(width: 5),
                     const CountryCodePicker(onChanged: print, showFlag: true),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: quizcolorPrimary,
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          style:const TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontRegular),
                          decoration:const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(16, 22, 16, 22),
                            counterText: "",
                            hintText: quizhintMobileNumber,
                            hintStyle: TextStyle(color: quiztextColorPrimary, fontSize: textSizeMedium),
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
               const SizedBox(height: 20),
                Container(
                  child: Column(
                    children: <Widget>[
                      text(quizlblalreadyhaveanaccount),
                      text(quizlblsignin, textColor: quizcolorPrimary, textAllCaps: true),
                    ],
                  ).onTap(() {
                    finish(context);
                  }),
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
                       const QuizVerification().launch(context);
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
