import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/Screens/repo_screen.dart';
import 'package:quiz/Screens/quiz_settings.dart';
import 'package:quiz/model/quiz_models.dart';
import 'package:quiz/utils/app_widget.dart';
import 'package:quiz/utils/quiz_colors.dart';
import 'package:quiz/utils/quiz_constant.dart';
import 'package:quiz/utils/quiz_data_generator.dart';
import 'package:quiz/utils/quiz_images.dart';
import 'package:quiz/utils/quiz_strings.dart';

class QuizProfile extends StatefulWidget {
  static String tag = '/QuizProfile';

  const QuizProfile({super.key});

  @override
  _QuizProfileState createState() => _QuizProfileState();
}

class _QuizProfileState extends State<QuizProfile> {
  late List<QuizBadgesModel> mList;
  late List<QuizScoresModel> mList1;

  int selectedPos = 1;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mList = quizBadgesData();
    mList1 = quizScoresData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final imgview = Container(
      color: quizappbackground,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Container(
                height: width * 0.35,
                width: width * 0.35,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: quizwhite, width: 4)),
                child: CircleAvatar(backgroundImage:const CachedNetworkImageProvider(quizimgPeople2), radius: MediaQuery.of(context).size.width / 8.5),
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: quizwhite, width: 2), color: quizwhite),
                child:const Icon(Icons.edit, size: 20).onTap(() {
                 const RepoScreen(enableAppbar: true).launch(context);
                }),
              ).paddingOnly(right: 16, top: 16).onTap(() {
                debugPrint("Edit profile");
              })
            ],
          ),
          text(quizlbl, textColor: quiztextColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontBold).paddingOnly(top: 24),
          text(quizlblXp, textColor: quiztextColorSecondary, fontSize: textSizeMedium, fontFamily: fontRegular).paddingOnly(top: 8),
         const SizedBox(height: 30),
          Container(
            width: width,
            decoration: boxDecoration(radius: spacingmiddle, bgColor: quizwhite, showShadow: false),
            margin:const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPos = 1;
                      });
                    },
                    child: Container(
                      padding:const EdgeInsets.all(8.0),
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius:const BorderRadius.only(topLeft: spacingmiddle, bottomLeft: spacingmiddle),
                        color: selectedPos == 1 ? quizwhite : Colors.transparent,
                        border: Border.all(color: selectedPos == 1 ? quizwhite : Colors.transparent),
                      ),
                      child: text(
                        quizlblBadges,
                        fontSize: textSizeMedium,
                        fontFamily: fontSemibold,
                        isCentered: true,
                        textColor: selectedPos == 1 ? quiztextColorPrimary : quiztextColorSecondary,
                      ),
                    ),
                  ),
                  flex: 1,
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: quizlightgray,
                ).center(),
                Flexible(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPos = 2;
                        });
                      },
                      child: Container(
                        padding:const EdgeInsets.all(16.0),
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius:const BorderRadius.only(topRight: spacingmiddle, bottomRight: spacingmiddle),
                          color: selectedPos == 2 ? quizwhite : Colors.transparent,
                          border: Border.all(color: selectedPos == 2 ? quizwhite : Colors.transparent),
                        ),
                        child: text(
                          quizlblScores,
                          fontSize: textSizeMedium,
                          fontFamily: fontSemibold,
                          isCentered: true,
                          textColor: selectedPos == 2 ? quiztextColorPrimary : quiztextColorSecondary,
                        ),
                      )),
                  flex: 1,
                ),
              ],
            ),
          ),
          selectedPos == 1
              ? Container(
                  decoration: boxDecoration(bgColor: quizwhite, radius: 10, showShadow: true),
                  width: MediaQuery.of(context).size.width - 32,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mList.length,
                      shrinkWrap: true,
                      physics:const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: <Widget>[
                                commonCacheImageWidget(
                                  mList[index].img,
                                  height: 50,
                                  width: 50,
                                ).paddingOnly(right: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[text(mList[index].title, fontFamily: fontMedium, textColor: quiztextColorPrimary), text(mList[index].subtitle, textColor: quiztextColorSecondary)],
                                ),
                              ],
                            ).paddingAll(8),
                          ))).paddingOnly(bottom: 16)
              : Container(
                  decoration: boxDecoration(bgColor: quizwhite, radius: 10, showShadow: true),
                  width: MediaQuery.of(context).size.width - 32,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mList1.length,
                      shrinkWrap: true,
                      physics:const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: <Widget>[
                                CachedNetworkImage(
                                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                                  imageUrl: mList1[index].img,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.fill,
                                ).cornerRadiusWithClipRRect(25).paddingOnly(right: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    text(mList1[index].title, fontFamily: fontMedium, textColor: quiztextColorPrimary),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[text(mList1[index].totalQuiz, textColor: quiztextColorSecondary), text(mList1[index].scores, textColor: quiztextColorSecondary, fontSize: textSizeMedium, fontFamily: fontRegular)],
                                    )
                                  ],
                                ),
                              ],
                            ).paddingAll(8),
                          ))).paddingOnly(bottom: 16)
        ],
      ),
    ).center();

    changeStatusColor(quizappbackground);

    return SafeArea(
      child: Scaffold(
        backgroundColor: quizappbackground,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon:const Icon(Icons.settings),
              color: blackColor,
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => QuizSettings())),
            ),
          ],
          leading: Container(),
          backgroundColor: quizappbackground,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          physics:const ScrollPhysics(),
          child: Container(color: quizappbackground, child: imgview),
        ),
      ),
    );
  }
}
