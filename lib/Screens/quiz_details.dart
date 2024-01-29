import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/Screens/quiz_card.dart';
import 'package:quiz/model/quiz_models.dart';
import 'package:quiz/utils/app_widget.dart';
import 'package:quiz/utils/quiz_colors.dart';
import 'package:quiz/utils/quiz_constant.dart';
import 'package:quiz/utils/quiz_data_generator.dart';
import 'package:quiz/utils/quiz_strings.dart';
import 'package:quiz/utils/quiz_widget.dart';

class QuizDetails extends StatefulWidget {
  static String tag = '/QuizDetails';

  const QuizDetails({super.key});

  @override
  _QuizDetailsState createState() => _QuizDetailsState();
}

class _QuizDetailsState extends State<QuizDetails> {
  late List<QuizTestModel> mList;

  @override
  void initState() {
    super.initState();
    mList = quizGetData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(quizappbackground);
    return Scaffold(
      backgroundColor: quizappbackground,
      body: Column(
        children: <Widget>[
         const quizTopBar(quizlblbiologybasics),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                const SizedBox(
                    height: 20,
                  ),
                  text(quizlblbiologyampscientificmethod, isLongText: true, fontFamily: fontBold, isCentered: true, fontSize: textSizeXLarge),
                  text(quiztext4to8lesson, textColor: quiztextColorSecondary),
                const  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mList.length,
                      shrinkWrap: true,
                      physics:const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return quizList(mList[index], index);
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class quizList extends StatelessWidget {
  late var width;
  late QuizTestModel model;

   quizList(QuizTestModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Container(
      margin:const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      decoration: boxDecoration(radius: 10, showShadow: true, bgColor: quizwhite),
      padding:const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                decoration:const BoxDecoration(shape: BoxShape.circle, color: quizcolorsetting),
                width: width / 6.5,
                height: width / 6.5,
                padding:const EdgeInsets.all(10),
                child: commonCacheImageWidget(
                  model.image,
                ),
              ),
             const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model.type, textColor: quiztextColorSecondary, fontSize: textSizeSMedium),
                  text(
                    model.heading,
                    fontFamily: fontMedium,
                  ),
                ],
              )
            ],
          ),
         const SizedBox(
            height: 16,
          ),
          text(model.description, textColor: quiztextColorSecondary),
         const SizedBox(
            height: 16,
          ),
          quizButton(
              textContent: quizlblbegin,
              onPressed: () {
                QuizCards().launch(context);
              })
        ],
      ),
    );
  }
}
