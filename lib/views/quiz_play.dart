import 'package:flutter/material.dart';
import 'package:quiz_app/views/results.dart';
import 'package:quiz_app/widget/widget.dart';
import 'package:quiz_app/model/question_model.dart';
import 'package:quiz_app/widgets/quiz_play_widgets.dart';

class QuizPlay extends StatefulWidget {
  final String quizId;

  QuizPlay(this.quizId);

  @override
  _QuizPlayState createState() => _QuizPlayState();
}

int _correct = 0;
int _incorrect = 0;
int _notAttempted = 0;
int total = 0;
State _topBarState;

class _QuizPlayState extends State<QuizPlay> {
  bool isLoading = true;
  List<QuestionModel> list;

  @override
  void initState() {
    list = QuestionModel.fetchAllQuestions();
    _notAttempted = list.length;
    _correct = 0;
    _incorrect = 0;
    isLoading = false;
    total = list.length;
    setState(() {});
    print("init don $total ${widget.quizId} ");

    // if (infoStream == null) {
    //   infoStream = Stream<List<int>>.periodic(Duration(milliseconds: 100), (x) {
    //     print("this is x $x");
    //     return [_correct, _incorrect];
    //   });
    // }

    super.initState();
  }

  @override
  void dispose() {
    list = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppLogo(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    InfoHeader(
                      length: list.length,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return QuizPlayTile(
                            questionModel: list[index],
                            index: index,
                          );
                        })
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          if (_notAttempted == 0) {
            Results.correct = _correct;
            Results.incorrect = _incorrect;
            Results.total = total;
            Results.notattempted = _notAttempted;
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Results()));
          }
        },
      ),
    );
  }
}

class InfoHeader extends StatefulWidget {
  final int length;

  InfoHeader({@required this.length});

  @override
  _InfoHeaderState createState() {
    _topBarState = _InfoHeaderState();
    return _topBarState;
  }
}

class _InfoHeaderState extends State<InfoHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 14),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          NoOfQuestionTile(
            text: "Total",
            number: widget.length,
          ),
          NoOfQuestionTile(
            text: "Correct",
            number: _correct,
          ),
          NoOfQuestionTile(
            text: "Incorrect",
            number: _incorrect,
          ),
          NoOfQuestionTile(
            text: "NotAttempted",
            number: _notAttempted,
          ),
        ],
      ),
    );
  }
}

class QuizPlayTile extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;

  QuizPlayTile({@required this.questionModel, @required this.index});

  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Q${widget.index + 1} ${widget.questionModel.question}",
              style:
                  TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.8)),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option1 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                  });
                }
                _notAttempted = _notAttempted - 1;
              }
              if (_topBarState != null) {
                _topBarState.setState(() {});
              }
            },
            child: OptionTile(
              option: "A",
              description: "${widget.questionModel.option1}",
              correctAnswer: widget.questionModel.correctOption,
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option2 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                  });
                }
                _notAttempted = _notAttempted - 1;
              }
              if (_topBarState != null) {
                _topBarState.setState(() {});
              }
            },
            child: OptionTile(
              option: "B",
              description: "${widget.questionModel.option2}",
              correctAnswer: widget.questionModel.correctOption,
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option3 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                  });
                }
                _notAttempted = _notAttempted - 1;
              }
              if (_topBarState != null) {
                _topBarState.setState(() {});
              }
            },
            child: OptionTile(
              option: "C",
              description: "${widget.questionModel.option3}",
              correctAnswer: widget.questionModel.correctOption,
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option4 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                  });
                }
                _notAttempted = _notAttempted - 1;
              }
              if (_topBarState != null) {
                _topBarState.setState(() {});
              }
            },
            child: OptionTile(
              option: "D",
              description: "${widget.questionModel.option4}",
              correctAnswer: widget.questionModel.correctOption,
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
