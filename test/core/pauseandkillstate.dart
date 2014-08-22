part of core_test;

class PauseAndKillState extends State {
  PauseAndKillState(String nextState) : super(nextState);
  

  static bool pauseIt = true;
  @override
  create() {
    if(pauseIt){
      pauseIt = false;
      endState(nextState);
    }else{
      killState(nextState);
    }
  }
}