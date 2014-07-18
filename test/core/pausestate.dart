part of core_test;

class PauseState extends State {
  PauseState(String name,[String nextState = null]) : super(name,nextState);

  
  @override
  create() {    
    endState();
  }
}