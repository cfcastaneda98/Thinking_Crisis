import 'package:thinking_crisis/Controller/GameScore.dart';
import 'package:thinking_crisis/Model/PromptResult.dart';
import '../Model/Prompt.dart';
import 'GameResult.dart';

class QuickPlay{
  int _roundTime = 0;
  final List<Prompt> _prompts;
  List<Prompt> get prompts => _prompts;
  int get length => prompts.length;
  QuickPlay(this._prompts);
  GameResult evaluate(){
    var score = GameScore(0);
    List<PromptResult> promptResult = [];
    return GameResult(promptResult, score);
  }
  int getRoundTime() => _roundTime;
  set RoundTime(int roundTime){
    _roundTime = roundTime;
  }
}