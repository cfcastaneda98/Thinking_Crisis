// Author: Carlos Castaneda, Isaac Campos
// Class: CS 4381
// Date modified: 12/4/22
// Instructor: Yoonsik Cheon
// Assignment: Thinking Crisis (Semester Project) (6 of 16)
// Purpose: Practice our skills to create our very own application
// which in this case is a guessing party game that uses only one phone.
// Implements the logic for the prompt result
import '../Controller/GameScore.dart';
///Stores the specific result of a prompt
class PromptResult{
  final String _prompt;
  final GameScore _score;
  String get prompt => _prompt;
  GameScore get score => _score;
  PromptResult(this._prompt,this._score);
}