import 'Prompt.dart';

class PromptPool{
  List<Prompt> quickPlayList = {
    'Horse',
    'Miner',
    'Chico Chihuahua',

  } as List<Prompt>;
  var over18List = {
    'Johnny Sins',
  };
  int get quickPlayLength => quickPlayList.length;
  PromptPool([this.quickPlayList = const[]]);
  List<Prompt> selectRandomQuickPlayPrompt(int num){
    var randomList = quickPlayList.map<Prompt>((Prompt prompt) => prompt.clone()).toList();
    randomList.shuffle();
    return randomList.sublist(0,num);
  }
}