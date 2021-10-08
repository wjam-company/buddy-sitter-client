// ignore_for_file: avoid_print

import 'package:flutter/material.dart'
    show FocusNode, KeyEventResult, RawKeyEvent;
import 'package:flutter/services.dart' show RawKeyDownEvent, LogicalKeyboardKey;

class BuddySitterKeyEventHandler {
  static KeyEventResult global(FocusNode focusNode, RawKeyEvent keyEvent) {
    if (keyEvent is RawKeyDownEvent) {
      print('=======\nkeyEvent = ' + keyEvent.toString());
      print('=======\nLogicalKeyboardKey.control = ' +
          LogicalKeyboardKey.control.toString());
      print('=======\nwas this a control key? ' +
          (keyEvent.logicalKey == LogicalKeyboardKey.control).toString());
      if (keyEvent.logicalKey == LogicalKeyboardKey.control) {
        print('control keydown');
      }
      if (keyEvent.logicalKey == LogicalKeyboardKey.controlLeft) {
        print('controlLeft keydown');
      }
      if (keyEvent.logicalKey == LogicalKeyboardKey.controlRight) {
        print('controlRight keydown');
      }
      if (keyEvent.logicalKey == LogicalKeyboardKey.keyA) {
        print('keyA keydown (sanity checking)');
        print('control pressed? ' + keyEvent.isControlPressed.toString());
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}
