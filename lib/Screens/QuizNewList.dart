import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/Screens/RepoScreen.dart';
import 'package:quiz/model/QuizModels.dart';
import 'package:quiz/utils/AppWidget.dart';
import 'package:quiz/utils/QuizColors.dart';
import 'package:quiz/utils/QuizConstant.dart';
import 'package:quiz/utils/QuizDataGenerator.dart';
import 'package:quiz/utils/QuizImages.dart';
import 'package:quiz/utils/QuizStrings.dart';

class QuizListing extends StatefulWidget {
  static String tag = '/QuizListing';

  @override
  _QuizListingState createState() => _QuizListingState();
}

class _QuizListingState extends State<QuizListing> {
  late List<NewQuizModel> mListings;

  var selectedGrid = true;
  var selectedList = false;

  @override
  void initState() {
    super.initState();
    mListings = getQuizData();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    final listing = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: mListings.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            RepoScreen(enableAppbar: true).launch(context);
          },
          child: Container(
            decoration: boxDecoration(radius: 16, showShadow: true, bgColor: quiz_white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
                      child: CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: mListings[index].quizImage, height: w * 0.4, width: MediaQuery.of(context).size.width / 0.25, fit: BoxFit.cover),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(mListings[index].quizName, fontSize: textSizeMedium, isLongText: true, fontFamily: fontMedium),
                      SizedBox(height: 8),
                      text(mListings[index].totalQuiz, textColor: quiz_textColorSecondary),
                    ],
                  ),
                ),
              ],
            ),
          ).paddingOnly(bottom: spacing_standard_new),
        ),
      ),
    );

    final gridList = StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      scrollDirection: Axis.vertical,
      itemCount: mListings.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        changeStatusColor(quiz_app_background);
        return Container(
          margin: EdgeInsets.all(8),

          //decoration: boxDecoration(radius: 16, showShadow: true, bgColor: quiz_white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
                child: CachedNetworkImage(
                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                  imageUrl: mListings[index].quizImage,
                  height: w * 0.4,
                  width: MediaQuery.of(context).size.width / 0.25,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0)),
                  color: quiz_white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    text(mListings[index].quizName, fontSize: textSizeMedium, maxLine: 2, fontFamily: fontMedium).paddingOnly(top: 8, left: 16, right: 16, bottom: 8),
                    text(mListings[index].totalQuiz, textColor: quiz_textColorSecondary).paddingOnly(left: 16, right: 16, bottom: 16),
                  ],
                ),
              ),
            ],
          ),
        ).cornerRadiusWithClipRRect(16).onTap(() {
          RepoScreen(enableAppbar: true).launch(context);
        });
      },
      //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.58, crossAxisSpacing: 16, mainAxisSpacing: 16),
    );

    changeStatusColor(quiz_app_background);

    return Scaffold(
      appBar: AppBar(
        title: text(quiz_lbl_new_quiz, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
        leading: Icon(
          Icons.arrow_back,
          color: quiz_colorPrimary,
          size: 30,
        ).onTap(() {
          Navigator.of(context).pop();
        }),
        centerTitle: true,
        backgroundColor: quiz_app_background,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: quiz_app_background,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    commonCacheImageWidget(
                      Quiz_ic_Grid,
                      height: 20,
                      width: 20,
                    ).onTap(() {
                      setState(() {
                        selectedList = false;
                        selectedGrid = true;
                      });
                    }).paddingOnly(top: 8, right: 16),
                    commonCacheImageWidget(
                      Quiz_ic_List,
                      height: 20,
                      width: 20,
                    ).onTap(() {
                      setState(() {
                        selectedList = true;
                        selectedGrid = false;
                      });
                    }).paddingOnly(top: 8, right: 16),
                  ],
                ),
                SingleChildScrollView(
                    child: Container(
                  margin: EdgeInsets.all(16),
                  child: selectedGrid ? gridList : listing,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
