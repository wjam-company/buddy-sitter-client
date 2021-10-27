import './localstorage.dart';

class BuddySitterData {
  final BuddySitterStorage state;

  BuddySitterData._internal()
      : state = BuddySitterStorage<bool>(type: 'log', initial: false);

  static final BuddySitterData _singleton = BuddySitterData._internal();

  factory BuddySitterData() => _singleton;
}
