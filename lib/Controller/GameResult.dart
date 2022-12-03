import '../Model/PromptResult.dart';
import 'GameScore.dart';

class GameResult{
  final List<PromptResult> _promptResults;
  final GameScore _finalScore;
  static int finalScore = 0;
  List<PromptResult> get promptResults => _promptResults;
  GameScore get score => _finalScore;

  GameResult(this._promptResults, this._finalScore);
}