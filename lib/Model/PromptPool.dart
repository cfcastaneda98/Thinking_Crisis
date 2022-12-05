// Author: Carlos Castaneda, Isaac Campos
// Class: CS 4381
// Date modified: 12/4/22
// Instructor: Yoonsik Cheon
// Assignment: Thinking Crisis (Semester Project) (5 of 16)
// Purpose: Practice our skills to create our very own application
// which in this case is a guessing party game that uses only one phone.
// Implements the logic for the prompt pool
import 'Prompt.dart';
///Stores the lists of prompts
class PromptPool{
  ///List of questions to be used in quick play mode
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
  ///List of questions to be used in over 18 mode
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
  ///Selects a random prompt from the quick play list to be displayed
  selectRandomPrompts(int num){
    var gameList = quickPlayList;
    gameList.shuffle();
    return gameList.sublist(0,num);
  }
}