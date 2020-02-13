import 'package:flutter/foundation.dart';

class Item {
  String name;
  int iLvl;
  bool isBop;
  bool unique;
  String slot;
  String armorProficiency;
  int armor;
  List<String> stats;
  List<String> classes;
  int durability;
  int reqLvl;
  List<String> effects;
  int gold;
  int silver;
  int copper;
  String dropped;
  String text;
  String imagePath;

  Item({
    @required this.name,
    @required this.iLvl,
    @required this.isBop,
    this.unique,
    @required this.slot,
    this.armorProficiency,
    this.armor,
    this.stats,
    this.classes,
    this.durability,
    this.reqLvl,
    this.effects,
    this.gold,
    this.silver,
    this.copper,
    this.dropped,
    this.text,
    this.imagePath,
  })  : assert(name != null),
        assert(iLvl != null),
        assert(isBop != null),
        assert(slot != null);

  String get bop {
    return isBop ? "Binds when picked up" : "Binds when equipped";
  }
}
