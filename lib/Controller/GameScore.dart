// Author: Carlos Castaneda, Isaac Campos
// Class: CS 4381
// Date modified: 12/4/22
// Instructor: Yoonsik Cheon
// Assignment: Thinking Crisis (Semester Project) (2 of 16)
// Purpose: Practice our skills to create our very own application
// which in this case is a guessing party game that uses only one phone.
///Stores the values necessary to keep track of the game score
class GameScore{
  static int currentPoints = 0;
  static int incorrectPoints = 0;
  final num _currentPoint;
  GameScore(this._currentPoint);
  num get points => _currentPoint;
}