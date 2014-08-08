part of dartrocket;

/**
 * This class contains the contants of every event.
 */

class Event {
  // DiplayObject events
  static const String ADDED = "added";
  static const String ADDED_TO_STAGE = "addedToStage";
  static const String ENTER_FRAME = "enterFrame";
  static const String EXIT_FRAME = "exitFrame";
  static const String REMOVED = "removed";
  static const String REMOVED_FROM_STAGE = "removedFromStage";
  static const String RESIZE = "resize";
  static const String RENDER = "render";
  static const String MOUSE_LEAVE = "mouseLeave";

  // Common events
  static const String OKAY = "okay";
  static const String CANCEL = "cancel";
  static const String CHANGE = "change";
  static const String CONFIRM = "confirm";
  static const String SCROLL = "scroll";
  static const String OPEN = "open";
  static const String CLOSE = "close";
  static const String SELECT = "select";
  static const String COMPLETE = "complete";
  static const String PROGRESS = "progress";

  // Keyboard events
  static const String KEY_DOWN = "keyDown";
  static const String KEY_UP = "keyUp";

  // Mouse events
  static const String CLICK = "click";
  static const String DOUBLE_CLICK = "doubleClick";

  static const String MOUSE_DOWN = "mouseDown";
  static const String MOUSE_UP = "mouseUp";
  static const String MOUSE_MOVE = "mouseMove";
  static const String MOUSE_OUT = "mouseOut";
  static const String MOUSE_OVER = "mouseOver";
  static const String MOUSE_WHEEL = "mouseWheel";

  static const String MIDDLE_CLICK = "middleClick";
  static const String MIDDLE_MOUSE_DOWN = "middleMouseDown";
  static const String MIDDLE_MOUSE_UP = "middleMouseUp";
  static const String RIGHT_CLICK = "rightClick";
  static const String RIGHT_MOUSE_DOWN = "rightMouseDown";
  static const String RIGHT_MOUSE_UP = "rightMouseUp";

  static const String CONTEXT_MENU = "contextMenu";
  static const String ROLL_OUT = "rollOut";
  static const String ROLL_OVER = "rollOver";

  // Text events
  static const String LINK = "link";
  static const String TEXT_INPUT = "textInput";

  // Touch events
  static const String TOUCH_BEGIN = "touchBegin";
  static const String TOUCH_END = "touchEnd";
  static const String TOUCH_CANCEL = "touchCancel";
  static const String TOUCH_MOVE = "touchMove";

  static const String TOUCH_OVER = "touchOver";
  static const String TOUCH_OUT = "touchOut";

  static const String TOUCH_ROLL_OUT = "touchRollOut";
  static const String TOUCH_ROLL_OVER = "touchRollOver";
  static const String TOUCH_TAP = "touchTap";

  static List<String> ALL_EVENT = [ADDED, ADDED_TO_STAGE, ENTER_FRAME,
      EXIT_FRAME, REMOVED, REMOVED_FROM_STAGE, RESIZE, RENDER, MOUSE_LEAVE, OKAY,
      CANCEL, CHANGE, CONFIRM, SCROLL, OPEN, CLOSE, SELECT, COMPLETE, PROGRESS,
      KEY_DOWN, KEY_UP, CLICK, DOUBLE_CLICK, MOUSE_DOWN, MOUSE_UP, MOUSE_MOVE,
      MOUSE_OUT, MOUSE_OVER, MOUSE_WHEEL, MIDDLE_CLICK, MIDDLE_MOUSE_DOWN,
      MIDDLE_MOUSE_UP, RIGHT_CLICK, RIGHT_MOUSE_DOWN, RIGHT_MOUSE_UP, CONTEXT_MENU,
      ROLL_OUT, ROLL_OVER, LINK, TEXT_INPUT, TOUCH_BEGIN, TOUCH_END, TOUCH_CANCEL,
      TOUCH_MOVE, TOUCH_OVER, TOUCH_OUT, TOUCH_ROLL_OUT, TOUCH_ROLL_OVER, TOUCH_TAP,];

}
