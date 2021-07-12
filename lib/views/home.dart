import 'package:flutter/material.dart';
import 'package:quiz_app/helper/authenticate.dart';
import 'package:quiz_app/widget/widget.dart';
import 'package:quiz_app/helper/constants.dart';
import 'package:quiz_app/model/home_model.dart';
import 'package:quiz_app/views/quiz_play.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream quizStream;
  // DatabaseService databaseService = new DatabaseService();

  Widget quizList() {
    List<HomeModel> data = HomeModel.getHomeData();
    return Container(
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return QuizTile(
                  noOfQuestions: data.length,
                  imageUrl: data[index].imageUrl,
                  title: data[index].title,
                  description: data[index].description,
                  id: data[index].id,
                );
              })
        ],
      ),
    );
  }

  String userName = '';
  @override
  void initState() {
    Constants.getUserData().then((value) {
      userName = value.name;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[300],
      appBar: AppBar(
        title: AppLogo(),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        //brightness: Brightness.li,
      ),
      body: quizList(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(userName),
            ),
            ListTile(
              title: Text('Sign out'),
              onTap: () {
                Constants.clearData();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Authenticate()),
                    (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class QuizTile extends StatelessWidget {
  final String imageUrl, title, id, description;
  final int noOfQuestions;

  QuizTile(
      {@required this.title,
      @required this.imageUrl,
      @required this.description,
      @required this.id,
      @required this.noOfQuestions});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QuizPlay(id)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                color: Colors.black26,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        description,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
