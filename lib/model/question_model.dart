class QuestionModel {
  String question;
  String option1;
  String option2;
  String option3;
  String option4;
  String correctOption;
  bool answered = false;

  QuestionModel(this.question, this.option1, this.option2, this.option3,
      this.option4, this.correctOption);

  static List<QuestionModel> fetchAllQuestions() {
    return [
      QuestionModel(
          "Which of the following blood component forms a plug at the site of injuries?",
          "Red blood cells",
          "Platelets",
          "White blood cells",
          "White blood cells",
          "Platelets"),
      QuestionModel("What alcoholic drink is made from molasses?", "Rum", "Gin",
          "Vodka", "Whisky", "Rum"),
      QuestionModel(
          "Which restaurant&#039;s mascot is a clown?",
          "McDonald&#039;s",
          "Whataburger",
          "Burger King",
          "Sonic",
          "McDonald&#039;s"),
      QuestionModel(
          "What was the first ever London Underground line to be built?",
          "Circle Line",
          "Bakerloo Line",
          "Metropolitan Line",
          "Victoria Line",
          "Metropolitan Line"),
      QuestionModel("Which sign of the zodiac comes between Virgo and Scorpio?",
          "Gemini", "Taurus", "Capricorn", "Libra", "Libra"),
      QuestionModel("What zodiac sign is represented by a pair of scales?",
          "Aries", "Libra", "Sagittarius", "Capricorn", "Libra"),
      QuestionModel(
          "Who is the youngest person to recieve a Nobel Prize?",
          "Lawrence Bragg",
          "Malala Yousafzai",
          "Yasser Arafat",
          "Werner Heisenberg",
          "Malala Yousafzai"),
      QuestionModel(
          "Which of the following is not an Ivy League University?",
          "Stanford",
          "Harvard",
          "Princeton",
          "University of Pennsylvania",
          "Stanford"),
      QuestionModel(
          "The drug cartel run by Pablo Escobar originated in which South American city?",
          "Bogot&aacute;",
          "Quito",
          "Medell&iacute;n",
          "Cali",
          "Medell&iacute;n"),
      QuestionModel(
          "What does the computer software acronym JVM stand for?",
          "Java Vendor Machine",
          "Java Visual Machine",
          "Just Virtual Machine",
          "Java Virtual Machine",
          "Java Virtual Machine")
    ];
  }
}
