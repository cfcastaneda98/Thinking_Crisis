import 'package:thinking_crisis/Controller/GameScore.dart';
import 'package:thinking_crisis/Model/PromptResult.dart';
import '../Model/Prompt.dart';
import 'GameResult.dart';

class QuickPlay{
  static int roundTime = 30;
  static int roundAmount = 1;
  final List<Prompt> _prompts;
  List<Prompt> get prompts => _prompts;
  int get length => prompts.length;
  QuickPlay(this._prompts);
  GameResult evaluate(){
    var score = GameScore(0);
    List<PromptResult> promptResult = [];
    return GameResult(promptResult, score);
  }
  int getRoundAmount() => roundAmount;
  set RoundAmount(int roundAmount){
    roundAmount = roundAmount;
  }
  int getRoundTime() => roundTime;
  set RoundTime(int roundTime){
    roundTime = roundTime;
  }
}