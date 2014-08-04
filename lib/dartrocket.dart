library dartrocket;

export "dart:html" show KeyCode;
export "package:stagexl/stagexl.dart" show Color, TextureAtlasFormat,
    TransitionFunction, Tween;

import "dart:async";
import "dart:math" as math;
import "dart:collection" show ListBase;
import "dart:html" show window, document, CanvasElement, KeyCode;
import "package:stagexl/stagexl.dart" as StageXL;


part "src/core/game.dart";
part "src/core/statemanager.dart";
part "src/core/state.dart";
part "src/core/group.dart";
part "src/core/gameobjectfactory.dart";
part "src/core/physics.dart";
part "src/core/world.dart";
part "src/core/camera.dart";

part "src/gameobject/interactive_bitmap.dart";
part "src/gameobject/sprite.dart";
part "src/gameobject/background.dart";
part "src/gameobject/text.dart";
part "src/gameobject/sound.dart";
part "src/gameobject/button.dart";

part "src/input/keyboard.dart";
part "src/input/touch.dart";

part "src/constants/event.dart";
part "src/constants/direction.dart";
