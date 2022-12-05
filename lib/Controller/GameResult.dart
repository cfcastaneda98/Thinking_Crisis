// Author: Carlos Castaneda, Isaac Campos
// Class: CS 4381
// Date modified: 12/4/22
// Instructor: Yoonsik Cheon
// Assignment: Thinking Crisis (Semester Project) (1 of 16)
// Purpose: Practice our skills to create our very own application
// which in this case is a guessing party game that uses only one phone.
// Implements the result for the game result
import '../Model/PromptResult.dart';
import 'GameScore.dart';
///Stores the final values for the specific game result.
class GameResult{
  final List<PromptResult> _promptResults;
  final GameScore _finalScore;
  static int finalScore = 0;
  List<PromptResult> get promptResults => _promptResults;
  GameScore get score => _finalScore;
  GameResult(this._promptResults, this._finalScore);
}