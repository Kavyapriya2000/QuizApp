class HomeModel {
  int noOfQuestions;
  String imageUrl;
  String title;
  String description;
  String id;

  HomeModel(
      this.noOfQuestions, this.imageUrl, this.title, this.description, this.id);

  static List<HomeModel> getHomeData() {
    return [
      HomeModel(
          10,
          "https://d2h0cx97tjks2p.cloudfront.net/blogs/wp-content/uploads/sites/2/2020/08/general-knowledge-questions-with-answers.jpg",
          "General Knowledge",
          "General knowledge is information that has been accumulated over time through various mediums.",
          "0")
    ];
  }
}
