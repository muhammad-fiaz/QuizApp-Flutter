import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/Screens/repo_screen.dart';
import 'package:quiz/model/quiz_models.dart';
import 'package:quiz/utils/app_widget.dart';
import 'package:quiz/utils/quiz_colors.dart';
import 'package:quiz/utils/quiz_constant.dart';
import 'package:quiz/utils/quiz_data_generator.dart';
import 'package:quiz/utils/quiz_images.dart';
import 'package:quiz/utils/quiz_strings.dart';

class QuizListing extends StatefulWidget {
  static String tag = '/QuizListing';

  const QuizListing({super.key});

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

    final listing = ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: mListings.length,
      shrinkWrap: true,
      physics:const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () {
         const RepoScreen(enableAppbar: true).launch(context);
        },
        child: Container(
          decoration: boxDecoration(radius: 16, showShadow: true, bgColor: quizwhite),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  ClipRRect(
                    borderRadius:const BorderRadius.only(topLeft: 16.0, topRight: 16.0),
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
                   const SizedBox(height: 8),
                    text(mListings[index].totalQuiz, textColor: quiztextColorSecondary),
                  ],
                ),
              ),
            ],
          ),
        ).paddingOnly(bottom: spacingstandardnew),
      ),
    );

    final gridList = StaggeredGridView.countBuilder(
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

          //decoration: boxDecoration(radius: 16, showShadow: true, bgColor: quiz_white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius:const BorderRadius.only(topLeft: 16.0, topRight: 16.0),
                child: CachedNetworkImage(
                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                  imageUrl: mListings[index].quizImage,
                  height: w * 0.4,
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
                    text(mListings[index].totalQuiz, textColor: quiztextColorSecondary).paddingOnly(left: 16, right: 16, bottom: 16),
                  ],
                ),
              ),
            ],
          ),
        ).cornerRadiusWithClipRRect(16).onTap(() {
         const RepoScreen(enableAppbar: true).launch(context);
        });
      },
      //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.58, crossAxisSpacing: 16, mainAxisSpacing: 16),
    );

    changeStatusColor(quizappbackground);

    return Scaffold(
      appBar: AppBar(
        title: text(quizlblnewquiz, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: quizappbackground,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    commonCacheImageWidget(
                      quizicGrid,
                      height: 20,
                      width: 20,
                    ).onTap(() {
                      setState(() {
                        selectedList = false;
                        selectedGrid = true;
                      });
                    }).paddingOnly(top: 8, right: 16),
                    commonCacheImageWidget(
                      quizicList,
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
                  margin:const EdgeInsets.all(16),
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
