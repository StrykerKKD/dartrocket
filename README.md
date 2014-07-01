<a rel="nofollow"><img src="http://www.logomaker.com/logo-images/6b330ef382354ce2.gif"/></a>

DartRocket is a HTML5 Game Framework, which is written in Dart and uses the StageXL rendering engine.
The main goal of this framework is to provide an easy to use solution for HTML5 game making with the Dart language.

##How to start?
This is how the most basic structure looks like with only one state.

 * Create index.html file, which has 
```
 <!DOCTYPE html>

<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index</title>
  </head>
 
  <body>   
    <script type="application/dart" src="index.dart"></script>
    <!-- for this next line to work, your pubspec.yaml file must have a dependency on 'browser' -->
    <script src="packages/browser/dart.js"></script>
  </body>
</html>
```
 * Create index.dart
```
library mygame;

import 'package:dartrocket/dartrocket.dart';

part "play.dart";

void main() {
  
  //adding play state to the statemanager
  game.stateManager.addState("play",new Play("play"));
  
  //start the play state
  game.stateManager.initState("play");
}
```
 * Create play.dart
 
```
 part of mygame;

class Play extends State {
  Play(String name, [String nextState]): super(name, nextState);

  load() {
    //loading resources here(image,sound, textureatlas etc..)
  }
  
  run() {
    //game logic goes here
  }
}
```

You can find additional examples in the documentation and in the [examples directory](https://github.com/StrykerKKD/dartrocket/tree/master/example) in dartrocket's github repo.

##Documentation
You can find the the current documentation on pub page of [dartrocket](http://pub.dartlang.org/packages/dartrocket).

##Blog
The Framework has a [blog](http://dartrocket.blogspot.hu), which will provide information about how the development is going.

##Examples
These examples build will be updated at least when there is a new version of DartRocket.
 [StateMachine](http://strykerkkd.github.io/js/projects/build/example/statemachine/index.html) show how the statemanager work.
 [SpaceInvader](http://strykerkkd.github.io/js/projects/build/example/spaceinvader/index.html) show a basic space invader game.