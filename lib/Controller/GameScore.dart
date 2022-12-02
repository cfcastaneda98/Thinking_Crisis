class GameScore{
  final num _currentPoints;
  GameScore(this._currentPoints);
  num get points => _currentPoints;
  GameScore operator +(other){
    if(other.runtimeType! != GameScore) throw TypeError();
    var newScore = _currentPoints + other.points;
    return GameScore(newScore);
  }
}