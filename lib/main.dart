import 'package:flutter/material.dart' show Focus, runApp;
import './presentation/app.dart' show BuddySitterApp;
import './device/web/keyboard.dart' show BuddySitterKeyEventHandler;

void main() {
  runApp(const Focus(
    onKey: BuddySitterKeyEventHandler.global,
    autofocus: true,
    child: BuddySitterApp(),
  ));
}
