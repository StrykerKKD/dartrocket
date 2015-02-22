library dartrocket.physics;

import "dart:math" as Math;

//=============================================================================

import "package:stagexl/stagexl.dart" as StageXL show Vector, Polygon, Point, DisplayObject;

//=============================================================================

import "package:dartrocket/src/core.dart" show Group;
import "package:dartrocket/src/gameobject.dart" show Sprite;
import "package:dartrocket/src/constant.dart" show Direction;

//=============================================================================

part 'physics/direction_system.dart';
part 'physics/movement_system.dart';
part 'physics/movement_control.dart';
part 'physics/physics_system.dart';
part 'physics/gravity.dart';
part 'physics/body.dart';