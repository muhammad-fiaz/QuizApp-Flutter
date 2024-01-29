import 'package:quiz/model/quiz_models.dart';
import 'package:quiz/utils/quiz_images.dart';

List<NewQuizModel> getQuizData() {
  List<NewQuizModel> list = [];
  NewQuizModel model1 = NewQuizModel();
  model1.quizName = "Biology & The \nScientific Method";
  model1.totalQuiz = "15 Quiz";
  model1.quizImage = quizicstudy1;

  NewQuizModel model2 = NewQuizModel();
  model2.quizName = "Geography Basics \nMethods";
  model2.totalQuiz = "5 Quiz";
  model2.quizImage = quizicstudy2;

  NewQuizModel model3 = NewQuizModel();
  model3.quizName = "Java Basics \nOOPs Concept";
  model3.totalQuiz = "10 Quiz";
  model3.quizImage = quiziccourse3;

  NewQuizModel model4 = NewQuizModel();
  model4.quizName = "Art and \nPainting Basic";
  model4.totalQuiz = "10 Quiz";
  model4.quizImage = quiziccourse1;

  NewQuizModel model5 = NewQuizModel();
  model5.quizName = "Communication Basic";
  model5.totalQuiz = "10 Quiz";
  model5.quizImage = quiziccommunication;

  NewQuizModel model6 = NewQuizModel();
  model6.quizName = "Investment and \nTypes";
  model6.totalQuiz = "10 Quiz";
  model6.quizImage = quiziccourse2;

  list.add(model1);
  list.add(model3);
  list.add(model6);
  list.add(model4);
  list.add(model5);
  list.add(model2);

  return list;
}

List<QuizTestModel> quizGetData() {
  List<QuizTestModel> list = [];
  QuizTestModel model1 = QuizTestModel();
  model1.heading = "The Scientific Method";
  model1.image = quizicquiz1;
  model1.type = "Quiz 1";
  model1.description = "Let's put your memory on our first topic to test.";
  model1.status = "true";

  QuizTestModel model2 = QuizTestModel();
  model2.heading = "Introduction to Biology";
  model2.image = quizicquiz2;
  model2.type = "Flashcards";
  model2.description = "Complete the above test to unlock this one.";
  model2.status = "false";

  QuizTestModel model3 = QuizTestModel();
  model3.heading = "Controlled Experiments";
  model3.image = quizicquiz1;
  model3.type = "Quiz 2";
  model3.description = "Let's put your memory on our first topic to test.";
  model3.status = "false";

  list.add(model1);
  list.add(model2);
  list.add(model3);

  return list;
}

List<QuizBadgesModel> quizBadgesData() {
  List<QuizBadgesModel> list = [];
  QuizBadgesModel model1 = QuizBadgesModel();
  model1.title = "Achiever";
  model1.subtitle = "Complete an exercise";
  model1.img = quiziclist2;

  QuizBadgesModel model2 = QuizBadgesModel();
  model2.title = "Perectionistf";
  model2.subtitle = "Finish All lesson of chapter";
  model2.img = quiziclist5;

  QuizBadgesModel model3 = QuizBadgesModel();
  model3.title = "Scholar";
  model3.subtitle = "Study two Cources";
  model3.img = quiziclist3;

  QuizBadgesModel model4 = QuizBadgesModel();
  model4.title = "Champion";
  model4.subtitle = "Finish #1 in Scoreboard";
  model4.img = quiziclist4;

  QuizBadgesModel model5 = QuizBadgesModel();
  model5.title = "Focused";
  model5.subtitle = "Study every day for 30 days";
  model5.img = quiziclist5;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);

  return list;
}

List<QuizScoresModel> quizScoresData() {
  List<QuizScoresModel> list = [];
  QuizScoresModel model1 = QuizScoresModel();
  model1.title = "Biology Basics";
  model1.totalQuiz = "20 Quiz";
  model1.img = quiziccourse1;
  model1.scores = "30/50";

  QuizScoresModel model2 = QuizScoresModel();
  model2.title = "Java Basics";
  model2.totalQuiz = "30 Quiz";
  model2.img = quiziccourse2;
  model2.scores = "30/50";

  QuizScoresModel model3 = QuizScoresModel();
  model3.title = "Art & Painting Basics";
  model3.totalQuiz = "10 Quiz";
  model3.img = quiziccourse3;
  model3.scores = "10/50";

  list.add(model1);
  list.add(model2);
  list.add(model3);

  return list;
}

List<QuizContactUsModel> quizContactUsData() {
  List<QuizContactUsModel> list = [];
  QuizContactUsModel model1 = QuizContactUsModel();
  model1.title = "Call Request";
  model1.subtitle = "+00 356 646 234";

  QuizContactUsModel model2 = QuizContactUsModel();
  model2.title = "Email";
  model2.subtitle = "Response within 24 business hours";

  list.add(model1);
  list.add(model2);

  return list;
}
