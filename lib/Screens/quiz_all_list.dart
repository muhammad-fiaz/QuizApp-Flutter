import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/Screens/quiz_details.dart';
import 'package:quiz/model/quiz_models.dart';
import 'package:quiz/utils/app_widget.dart';
import 'package:quiz/utils/quiz_colors.dart';
import 'package:quiz/utils/quiz_constant.dart';
import 'package:quiz/utils/quiz_data_generator.dart';
import 'package:quiz/utils/quiz_strings.dart';

class QuizAllList extends StatefulWidget {
  static String tag = '/QuizAllList';

  const QuizAllList({super.key});

  @override
  _QuizAllListState createState() => _QuizAllListState();
}

class _QuizAllListState extends State<QuizAllList> {
  late List<NewQuizModel> mListings;
  int selectedPos = 1;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getQuizData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final quizAll = StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      staggeredTileBuilder: (index) =>const StaggeredTile.fit(2),
      scrollDirection: Axis.vertical,
      itemCount: mListings.length,
      physics:const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        changeStatusColor(quizappbackground);
        return Container(
          margin:const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius:const BorderRadius.only(topLeft: 16.0, topRight: 16.0),
                child: CachedNetworkImage(
                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                  imageUrl: mListings[index].quizImage,
                  height: width * 0.4,
                  width: MediaQuery.of(context).size.width / 0.25,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration:const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: 16.0, bottomRight: 16.0),
                  color: quizwhite,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    text(mListings[index].quizName, fontSize: textSizeMedium, maxLine: 2, fontFamily: fontMedium).paddingOnly(top: 8, left: 16, right: 16, bottom: 8),
                    text(mListings[index].totalQuiz, textColor: quiztextColorSecondary).paddingOnly(left: 16, right: 16, bottom: 8),
                  ],
                ),
              ),
            ],
          ),
        ).cornerRadiusWithClipRRect(16).onTap(() {
         const QuizDetails().launch(context);
        });
      },
      //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.67, mainAxisSpacing: 16, crossAxisSpacing: 16),
    );

    Widget quizCompleted = StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      staggeredTileBuilder: (index) =>const StaggeredTile.fit(2),
      scrollDirection: Axis.vertical,
      itemCount: mListings.length,
      physics:const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        changeStatusColor(quizappbackground);
        return Container(
          margin:const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius:const BorderRadius.only(topLeft: 16.0, topRight: 16.0),
                child: CachedNetworkImage(
                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                  imageUrl: mListings[index].quizImage,
                  height: width * 0.4,
                  width: MediaQuery.of(context).size.width / 0.25,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration:const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: 16.0, bottomRight: 16.0),
                  color: quizwhite,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text(mListings[index].quizName, fontSize: textSizeMedium, maxLine: 2, fontFamily: fontMedium).paddingOnly(top: 8, left: 16, right: 16, bottom: 8),
                    text(mListings[index].totalQuiz, textColor: quiztextColorSecondary).paddingOnly(left: 16, right: 16, bottom: 16),
                    LinearProgressIndicator(
                      value: 0.5,
                      backgroundColor: textSecondaryColor.withOpacity(0.2),
                      valueColor:const AlwaysStoppedAnimation<Color>(quizgreen),
                    ).paddingOnly(left: 16, right: 16, bottom: 16),
                  ],
                ),
              ),
            ],
          ),
        ).cornerRadiusWithClipRRect(16).onTap(() {
         const QuizDetails().launch(context);
        });
      },
      //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.60, mainAxisSpacing: 16, crossAxisSpacing: 16),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: quizappbackground,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
             const SizedBox(height: 40),
              Container(
                width: width,
                decoration: boxDecoration(radius: spacingmiddle, bgColor: quizwhite, showShadow: false),
                margin:const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          selectedPos = 1;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: spacingmiddle, bottomLeft: spacingmiddle),
                            color: selectedPos == 1 ? quizwhite : Colors.transparent,
                            border: Border.all(color: selectedPos == 1 ? quizwhite : Colors.transparent),
                          ),
                          child: text(
                            quizlblAll,
                            fontSize: textSizeMedium,
                            isCentered: true,
                            fontFamily: fontMedium,
                            textColor: selectedPos == 1 ? quiztextColorPrimary : quiztextColorSecondary,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Container(height: 40, width: 1, color: quizlightgray).center(),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPos = 2;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: spacingmiddle, bottomRight: spacingmiddle),
                            color: selectedPos == 2 ? quizwhite : Colors.transparent,
                            border: Border.all(color: selectedPos == 2 ? quizwhite : Colors.transparent),
                          ),
                          child: text(
                            quizlblCompleted,
                            fontSize: textSizeMedium,
                            isCentered: true,
                            fontFamily: fontMedium,
                            textColor: selectedPos == 2 ? quiztextColorPrimary : quiztextColorSecondary,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                physics:const ScrollPhysics(),
                child: Container(
                  margin:const EdgeInsets.only(right: 8, left: 8),
                  child: selectedPos == 1 ? quizAll : quizCompleted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
