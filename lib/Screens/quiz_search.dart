import 'package:flutter/material.dart';
import 'package:quiz/Screens/repo_screen.dart';
import 'package:quiz/model/quiz_models.dart';
import 'package:quiz/utils/quiz_colors.dart';
import 'package:quiz/utils/quiz_data_generator.dart';

class QuizSearch extends StatefulWidget {
  static String tag = '/QuizSearch';

  const QuizSearch({super.key});

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
    return const Scaffold(
      backgroundColor: quizappbackground,
      body: RepoScreen(enableAppbar: true),
    );
  }
}
