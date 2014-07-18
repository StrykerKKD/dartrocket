part of core_test;

class KillState extends State {
  KillState(String name,[String nextState = null]) : super(name,nextState);
  

  @override
  create() {
    killState();
  }
}