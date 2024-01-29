import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/Screens/quiz_details.dart';
import 'package:quiz/Screens/quiz_new_list.dart';
import 'package:quiz/Screens/quiz_search.dart';
import 'package:quiz/model/quiz_models.dart';
import 'package:quiz/utils/app_widget.dart';
import 'package:quiz/utils/quiz_colors.dart';
import 'package:quiz/utils/quiz_constant.dart';
import 'package:quiz/utils/quiz_data_generator.dart';
import 'package:quiz/utils/quiz_strings.dart';
import 'package:quiz/utils/quiz_widget.dart';

class QuizHome extends StatefulWidget {
  static String tag = '/QuizHome';

  const QuizHome({super.key});

  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  late List<NewQuizModel> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getQuizData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: quizappbackground,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding:const EdgeInsets.only(bottom: 16),
              child: Column(
                children: <Widget>[
                 const SizedBox(height: 30),
                  text(quizlblhiantonio, fontFamily: fontBold, fontSize: textSizeXLarge),
                  text(quizlblwhatwouldyouliketolearnntodaysearchbelow, textColor: quiztextColorSecondary, isLongText: true, isCentered: true),
                 const SizedBox(height: 30),
                  Container(
                    margin:const EdgeInsets.all(16.0),
                    decoration: boxDecoration(radius: 10, showShadow: true, bgColor: quizwhite),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(child: quizEditTextStyle(quizlblsearch, isPassword: false)),
                        Container(
                          margin:const EdgeInsets.only(right: 10),
                          decoration: boxDecoration(radius: 10, showShadow: false, bgColor: quizcolorPrimary),
                          padding:const EdgeInsets.all(10),
                          child:const Icon(Icons.search, color: quizwhite),
                        ).onTap(() {
                        const  QuizSearch().launch(context);
                          setState(() {});
                        })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text(quizlblnewquiz, textAllCaps: true, fontFamily: fontMedium, fontSize: textSizeNormal),
                        text(
                          quizlblviewall,
                          textColor: quiztextColorSecondary,
                        ).onTap(() {
                          setState(() {
                           const QuizListing().launch(context);
                          });
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    //height: MediaQuery.of(context).size.width * 0.8,
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mListings.length,
                      shrinkWrap: true,
                      physics:const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => GestureDetector(
                        onTap: () {
                         const QuizDetails().launch(context);
                        },
                        child: NewQuiz(mListings[index], index),
                      ),
                    ),
                  ).paddingOnly(bottom: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class NewQuiz extends StatelessWidget {
  late NewQuizModel model;

  NewQuiz(NewQuizModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      margin:const EdgeInsets.only(left: 16),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: boxDecoration(radius: 16, showShadow: true, bgColor: quizwhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              ClipRRect(
                borderRadius:const BorderRadius.only(topLeft: 16.0, topRight: 16.0),
                child: CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: model.quizImage, height: w * 0.4, width: MediaQuery.of(context).size.width * 0.75, fit: BoxFit.cover),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    text(model.quizName, fontSize: textSizeMedium, isLongText: true, fontFamily: fontMedium, isCentered: false),
                    text(model.totalQuiz, textColor: quiztextColorSecondary),
                  ],
                ),
                const Icon(Icons.arrow_forward, color: quiztextColorSecondary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
