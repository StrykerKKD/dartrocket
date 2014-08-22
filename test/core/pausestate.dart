part of core_test;

class PauseState extends State {
  PauseState(String nextState) : super(nextState);

  
  @override
  create() {
    endState(nextState);
  }
}