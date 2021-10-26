import 'package:flutter/material.dart' show Focus, runApp;
import './presentation/app.dart' show BuddySitterApp;

void main() {
  runApp(
    const Focus(
      autofocus: true,
      child: BuddySitterApp(),
    ),
  );
}
