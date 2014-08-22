part of core_test;

class KillState extends State {
  KillState(String nextState) : super(nextState);
  

  @override
  create() {
    killState(nextState);
  }
}