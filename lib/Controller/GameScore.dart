class GameScore{
  static int currentPoints = 0;
  static int incorrectPoints = 0;
  final num _currentPoint;
  GameScore(this._currentPoint);
  num get points => _currentPoint;
}