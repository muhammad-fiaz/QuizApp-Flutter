import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/Screens/RepoButton.dart';
import 'package:quiz/utils/AppWidget.dart';

class RepoScreen extends StatefulWidget {
  final bool? enableAppbar;

  RepoScreen({this.enableAppbar = false});

  @override
  _RepoScreenState createState() => _RepoScreenState();
}

class _RepoScreenState extends State<RepoScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Icon(Icons.arrow_back, size: 24).paddingAll(16).onTap(() {
              finish(context);
            }).visible(widget.enableAppbar!),
            SizedBox(
              width: context.width(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: boxDecorationDefault(shape: BoxShape.circle),
                      child: commonCacheImageWidget(
                        "images/quiz/ic_background.png",
                        height: 180,
                      ).cornerRadiusWithClipRRect(90)),
                  22.height,
                  Text(
                    'This is UI is Still in Active Development.',
                    style: boldTextStyle(size: 22),
                    textAlign: TextAlign.center,
                  ),
                  16.height,
                  RepoButton(),
                ],
              ),
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
