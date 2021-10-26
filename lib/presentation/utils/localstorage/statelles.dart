class BuddySitterData {
  BuddySitterData._internal();

  static final BuddySitterData _singleton = BuddySitterData._internal();

  factory BuddySitterData() => _singleton;
}
