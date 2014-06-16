library dartrocket;

export "package:stagexl/stagexl.dart" show TransitionFunction,Color;

import "dart:async";
import "dart:html" show CanvasElement, document, window;
import 'dart:collection' show ListBase;
import "package:stagexl/stagexl.dart" as StageXL;

part "src/core/game.dart";
part "src/core/statemanager.dart";
part "src/core/state.dart";
part "src/core/group.dart";

part "src/gameobject/interactive_bitmap.dart";
part "src/gameobject/sprite.dart";
part "src/gameobject/background.dart";
part "src/gameobject/text.dart";
part "src/gameobject/sound.dart";
part "src/gameobject/button.dart";

part "src/static/events.dart";