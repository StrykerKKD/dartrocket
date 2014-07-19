part of core_test;

class PauseAndIdle extends State {
  PauseAndIdle(String name,[String nextState]) : super(name,nextState);

  static bool pauseIt = true;
  @override
  create() {
    if(pauseIt){
      pauseIt=false;
      endState();
    }
  }
}