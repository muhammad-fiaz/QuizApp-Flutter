import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components.dart';
import '../model/items_model.dart';
import '../utils/colors.dart';

// OnBoardingScreens Controller
class onBoardingScreenHome extends StatefulWidget {
  const onBoardingScreenHome({Key? key}) : super(key: key);

  @override
  State<onBoardingScreenHome> createState() => _HomePageState();
}

class _HomePageState extends State<onBoardingScreenHome> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;


  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget animation(
    int index,
    int delay,
    Widget child,
  ) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            /// ---------------------------
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: pageController,
                itemCount: listOfItems.length,
                onPageChanged: (newIndex) {
                  setState(() {
                    currentIndex = newIndex;
                  });
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: ((context, index) {
                  return SizedBox(
                    width: size.width,
                    height: size.height,
                    child: Column(
                      children: [
                        /// IMG
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                          width: size.width,
                          height: size.height / 2.5,
                          child: animation(
                            index,
                            100,
                            Image.asset(listOfItems[index].img),
                          ),
                        ),

                        /// TITLE TEXT
                        Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 15),
                            child: animation(
                              index,
                              300,
                              Text(
                                listOfItems[index].title,
                                textAlign: TextAlign.center,
                                style: textTheme.headline1?.copyWith(
                                    fontSize: 24, fontWeight: FontWeight.bold)
                              ),
                            )),

                        /// SUBTITLE TEXT
                        animation(
                          index,
                          500,
                          Text(
                            listOfItems[index].subTitle,
                            textAlign: TextAlign.center,
                            style: textTheme.headline2?.copyWith(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),

            /// ---------------------------
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// PAGE INDICATOR
                  SmoothPageIndicator(
                    controller: pageController,
                    count: listOfItems.length,
                    effect: const ExpandingDotsEffect(
                      spacing: 6.0,
                      radius: 10.0,
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      expansionFactor: 3.8,
                      dotColor: Colors.grey,
                      activeDotColor: MyColors.btnColor,
                    ),
                    onDotClicked: (newIndex) {
                      setState(() {
                        currentIndex = newIndex;
                        pageController.animateToPage(newIndex,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      });
                    },
                  ),
                  currentIndex == 2

                      /// GET STARTED BTN
                      ? GetStartBtn(size: size, textTheme: textTheme)

                      /// SKIP BTN
                      : SkipBtn(
                          size: size,
                          textTheme: textTheme,
                          onTap: () {
                            setState(() {
                              pageController.animateToPage(2,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastOutSlowIn);
                            });
                          },
                        )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
