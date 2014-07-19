part of core_test;

class PauseAndKillState extends State {
  PauseAndKillState(String name,[String nextState]) : super(name,nextState);
  

  static bool pauseIt = true;
  @override
  create() {
    if(pauseIt){
      pauseIt = false;
      endState();
    }else{
      killState();
    }
  }
}