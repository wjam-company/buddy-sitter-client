import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:flutter/foundation.dart';

import './localstorage.dart';

// ! TODO add color to url of image

class BuddySitterData extends ChangeNotifier {
  final BuddySitterStorage state;
  final Map<String, BuddySitterColor> colorFromImages = {};

  BuddySitterData._internal()
      : state = BuddySitterStorage<bool>(type: 'log', initial: false);

  static final BuddySitterData _singleton = BuddySitterData._internal();

  factory BuddySitterData() => _singleton;
}
