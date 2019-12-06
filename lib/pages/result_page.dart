import 'package:flutter/material.dart';
import 'package:flutter_story_chooser_app/models/story_manager.dart';

class ResultPage extends StatelessWidget {
  StoryManager storyManager;
  ResultPage(this.storyManager);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                storyManager.userResult(),
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                color: Colors.orange,
                child: Text(
                  "Play Again",
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
                onPressed: () {
                  storyManager.resetGame();
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
