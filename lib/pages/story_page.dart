import 'package:flutter/material.dart';
import 'package:flutter_story_chooser_app/models/story.dart';
import 'package:flutter_story_chooser_app/models/story_manager.dart';
import 'package:flutter_story_chooser_app/pages/result_page.dart';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryManager storyManager = StoryManager();
  List<Story> storyList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storyList = storyManager.getStoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text("Make Your Own Destiny"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        storyManager.storyBody(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(15),
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildAnswerButton(storyManager.storyAnswer1()),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(15),
                  color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildAnswerButton(storyManager.storyAnswer2()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FlatButton buildAnswerButton(
    String answer,
  ) {
    return FlatButton(
      child: Text(answer),
      onPressed: () {
        setState(() {
          var userAnswer = answer;
          storyManager.setStoryMap(userAnswer);
          showResultPage();
        });
      },
    );
  }

  showResultPage() {
    var gameOver = storyManager.isGameOver();
    if (gameOver)
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ResultPage(storyManager)));
  }
}
