import '../Controller/GameScore.dart';

class PromptResult{
  final String _prompt;
  final GameScore _score;

  String get prompt => _prompt;
  GameScore get score => _score;

  PromptResult(this._prompt,this._score);
}