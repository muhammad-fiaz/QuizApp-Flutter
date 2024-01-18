

class Chat {
  final String title;
  final String subtitle;

  Chat({
    required this.title,
    required this.subtitle,
  });
}

class Items {
  final String img;
  final String title;
  final String subTitle;
  final Chat chat;

  Items({
    required this.img,
    required this.title,
    required this.subTitle,
    required this.chat,
  });
}

//  onBoardingScreens Intro Contents for Quiz App
List<Items> listOfItems = [
  Items(
    img: "images/quiz/quiz_logo.jpg",
    title: "Challenge your friends",
    subTitle:
    "Engage in quiz challenges with your friends\nand family using our app.",
    chat: Chat(
      title: "Quiz Challenges",
      subtitle: "Challenge your best friends to quiz battles.",
    ),
  ),
  Items(
    img: "images/quiz/quiz_logo.jpg",
    title: "Join exciting quiz groups",
    subTitle:
    "Find and join groups that share your quiz\ninterests and participate together.",
    chat: Chat(
      title: "Quiz Groups",
      subtitle: "Join groups with quiz enthusiasts.",
    ),
  ),
  Items(
    img: "images/quiz/quiz_logo.jpg",
    title: "Discover quiz enthusiasts",
    subTitle:
    "Connect with new people who share your\npassion for quizzes around the world.",
    chat: Chat(
      title: "Quiz Connections",
      subtitle: "Discover and chat with fellow quiz enthusiasts.",
    ),
  ),
];

