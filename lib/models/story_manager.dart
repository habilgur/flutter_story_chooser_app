import 'package:flutter/cupertino.dart';
import 'package:flutter_story_chooser_app/models/story.dart';

class StoryManager {
  int _storyIndex = 0;
  bool _gameOver = false;
  String _userTypeResult = "";

  List<Story> _storyList = [
    Story("Story1", "answer1", "answer2"),
    Story("Story2", "answer1", "answer2"),
    Story("Story3", "answer1", "answer2"),
    Story("Story4", "answer1", "answer2"),
    Story("Story5", "answer1", "answer2"),
    Story("Story6", "answer1", "answer2"),
    Story("Story7", "answer1", "answer2"),
    Story("Story8", "answer1", "answer2"),
    Story("Story9", "answer1", "answer2"),
    Story("Story10", "answer1", "answer2")
  ];

  List<Story> getStoryList() => _storyList;
  String storyBody() => _storyList[_storyIndex].body;
  String storyAnswer1() => _storyList[_storyIndex].answer1;
  String storyAnswer2() => _storyList[_storyIndex].answer2;
  bool isGameOver() => _gameOver;
  String userResult() => _userTypeResult;

  void resetGame() {
    _storyIndex = 0;
    _gameOver = false;
  }

  void setStoryMap(String userAnswer) {
    if (_storyIndex == 0 && userAnswer == "answer1")
      _storyIndex = 2;
    else if (_storyIndex == 2 && userAnswer == "answer2")
      _storyIndex = 4;
    else if (_storyIndex == 4 && userAnswer == "answer1")
      _storyIndex = 7;
    else if (_storyIndex == 7 && userAnswer == "answer2") {
      _userTypeResult = "You are an Early Bird";
      _gameOver = true;
    } else if (_storyIndex == _storyList.length - 1) {
      _userTypeResult = "You are a Lazy Bird";
      _gameOver = true;
    } else
      _storyIndex++;
  }
}
