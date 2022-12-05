import 'package:thinking_crisis/Controller/GameScore.dart';
import 'package:thinking_crisis/Model/PromptResult.dart';
import '../Model/Prompt.dart';
// Author: Carlos Castaneda, Isaac Campos
// Class: CS 4381
// Date modified: 12/4/22
// Instructor: Yoonsik Cheon
// Assignment: Thinking Crisis (Semester Project) (3 of 16)
// Purpose: Practice our skills to create our very own application
// which in this case is a guessing party game that uses only one phone.
// Implements the logic for the Quick Play mode
import 'GameResult.dart';
///Keeps the necessary settings to initiate the Quick Play mode
class QuickPlay{
  static int roundTime = 30;
  static int roundAmount = 1;
  final List<Prompt> _prompts;
  List<Prompt> get prompts => _prompts;
  int get length => prompts.length;
  QuickPlay(this._prompts);
  ///Returns the evaluated game score to the game result
  GameResult evaluate(){
    var score = GameScore(0);
    List<PromptResult> promptResult = [];
    return GameResult(promptResult, score);
  }
  ///Gets the total number of rounds that will be used in the game
  int getRoundAmount() => roundAmount;
  set RoundAmount(int roundAmount){
    roundAmount = roundAmount;
  }
  ///Gets the total time for ech round that will be used in the session
  int getRoundTime() => roundTime;
  set RoundTime(int roundTime){
    roundTime = roundTime;
  }
}