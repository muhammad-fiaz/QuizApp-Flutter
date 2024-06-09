import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/Screens/repo_screen.dart';
import 'package:quiz/utils/app_widget.dart';
import 'package:quiz/utils/quiz_colors.dart';
import 'package:quiz/utils/quiz_strings.dart';

class QuizSettings extends StatefulWidget {
  static String tag = '/QuizSetting';

  @override
  _QuizSettingsState createState() => _QuizSettingsState();
}

class _QuizSettingsState extends State<QuizSettings> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(quizappbackground);
    return Scaffold(
      backgroundColor: quizappbackground,
      appBar: AppBar(
        title: Text(
          quizlblsetting,
          style: primaryTextStyle(size: 18, fontFamily: "Medium"),
        ),
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin:const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                   const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(color: quizwhite, borderRadius: BorderRadius.circular(8), boxShadow: defaultBoxShadow()),
                      margin:const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          quizSettingOptionPattern1(Icons.person, quizlbleditprofile, quizusername).onTap(() {
                            setState(() {
                             const RepoScreen(enableAppbar: true).launch(context);
                            });
                          }),
                          quizSettingOptionPattern1(Icons.email, quizlblemail, quizemail).onTap(() {
                            setState(() {
                             const RepoScreen(enableAppbar: true).launch(context);
                            });
                          }),
                          quizSettingOptionPattern1(Icons.vpn_key, quizlblpassword, quizsubinfopassword).onTap(() {
                            setState(() {
                             const RepoScreen(enableAppbar: true).launch(context);
                            });
                          }),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: quizwhite, borderRadius: BorderRadius.circular(8), boxShadow: defaultBoxShadow()),
                      margin:const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: <Widget>[
                          quizSettingOptionPattern2(Icons.star, quizlblscoreboard),
                          quizSettingOptionPattern2(Icons.add_box, quizlblnewcourse),
                          quizSettingOptionPattern2(Icons.notifications, quizlblstudyreminder),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: quizwhite, borderRadius: BorderRadius.circular(8), boxShadow: defaultBoxShadow()),
                      margin:const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: <Widget>[
                          quizSettingOptionPattern3(Icons.help, quizlblhelp).onTap(() {
                            setState(() {
                             const RepoScreen(enableAppbar: true).launch(context);
                            });
                          }),
                          quizSettingOptionPattern3(Icons.security, quizlblprivacy),
                          quizSettingOptionPattern3(Icons.chat_bubble, quizlblcontactus).onTap(() {
                            setState(() {
                             const RepoScreen(enableAppbar: true).launch(context);
                            });
                          }),
                        ],
                      ),
                    ),
                    Text(
                      quizlbllogout,
                      style: boldTextStyle(color: quizcolorPrimary, size: 18),
                    ).paddingAll(16).onTap(() {
                      finish(context);
                    })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget quizSettingOptionPattern1(var settingIcon, var heading, var info) {
  return Padding(
    padding:const EdgeInsets.fromLTRB(16, 10, 16, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration:const BoxDecoration(shape: BoxShape.circle, color: quizcolorsetting),
              width: 45,
              height: 45,
              padding:const EdgeInsets.all(4),
              child: Icon(
                settingIcon,
                color: quizwhite,
              ),
            ),
           const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(heading),
                Text(
                  info,
                  style: primaryTextStyle(color: quiztextColorSecondary, size: 14),
                )
              ],
            ),
          ],
        ),
      const  Icon(
          Icons.keyboard_arrow_right,
          color: quiziconcolor,
        )
      ],
    ),
  );
}

Widget quizSettingOptionPattern2(var icon, var heading) {
  bool isSwitched1 = false;

  return Padding(
    padding:const EdgeInsets.fromLTRB(16, 10, 16, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration:const BoxDecoration(shape: BoxShape.circle, color: quizcolorsetting),
              width: 45,
              height: 45,
              padding:const EdgeInsets.all(4),
              child: Icon(
                icon,
                color: quizwhite,
              ),
            ),
           const SizedBox(
              width: 16,
            ),
            Text(heading),
          ],
        ),
        Switch(
          value: isSwitched1,
          onChanged: (value) {
            // setState(() {
            isSwitched1 = value;
            //  });
          },
          activeTrackColor: quizcolorPrimary,
          activeColor: quizviewcolor,
        )
      ],
    ),
  );
}

Widget quizSettingOptionPattern3(var icon, var heading) {
  return Padding(
    padding:const EdgeInsets.fromLTRB(16, 10, 16, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration:const BoxDecoration(shape: BoxShape.circle, color: quizcolorsetting),
              width: 45,
              height: 45,
              padding:const EdgeInsets.all(4),
              child: Icon(
                icon,
                color: quizwhite,
              ),
            ),
           const SizedBox(
              width: 16,
            ),
            Text(heading),
          ],
        ),
       const Icon(
          Icons.keyboard_arrow_right,
          color: quiziconcolor,
        )
      ],
    ),
  );
}
