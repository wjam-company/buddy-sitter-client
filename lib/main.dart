import 'package:flutter/material.dart' show Focus, runApp;
import './presentation/app.dart' show BuddySitterApp;

void main() {
  runApp(const Focus(
    //onKey: BuddySitterKeyEventHandler.global,
    autofocus: true,
    child: BuddySitterApp(),
  ));
}
