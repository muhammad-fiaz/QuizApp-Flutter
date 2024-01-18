import 'package:flutter/material.dart';
import 'package:quiz/Screens/RepoScreen.dart';
import 'package:quiz/model/QuizModels.dart';
import 'package:quiz/utils/QuizColors.dart';
import 'package:quiz/utils/QuizDataGenerator.dart';

class QuizSearch extends StatefulWidget {
  static String tag = '/QuizSearch';

  @override
  _QuizSearchState createState() => _QuizSearchState();
}

class _QuizSearchState extends State<QuizSearch> {
  late List<NewQuizModel> mListings;
  var searchCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    mListings = getQuizData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: quiz_app_background,
      body: RepoScreen(enableAppbar: true),
    );
  }
}
