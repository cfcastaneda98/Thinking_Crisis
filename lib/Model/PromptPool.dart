import 'Prompt.dart';

class PromptPool{
  var quickPlayList = [
    'Horse',
    'Miner',
    'Chico Chihuahua',
    'Pikachu',
    'Yoda',
    'Gollum',
    'Goku',
    'Don Ramon',
    'Shrek',
    'John Cena'
  ];
  var over18List = [
    'Johnny Sins',
    'Ayuwoke',
    'Harambe',
    'Chucky',
    'Yeezy',
    'Quagmire',
    'The Deep',
    'Daenerys',
    'PEPE',
    'Cartman'
  ];
  int get quickPlayLength => quickPlayList.length;
  int get over18Length => over18List.length;
  selectRandomPrompts(int num){
    var gameList = quickPlayList;
    gameList.shuffle();
    return gameList.sublist(0,num);
  }
}