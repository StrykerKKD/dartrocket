part of core_test;

class PauseAndIdle extends State {
  PauseAndIdle(String nextState) : super(nextState);

  static bool pauseIt = true;
  @override
  create() {
    if(pauseIt){
      pauseIt=false;
      endState(nextState);
    }
  }
}