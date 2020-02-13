import 'package:classic_bis/Item.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Classic BiS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'WoW Classic BiS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String phaseValue;
  String classValue;
  String specValue;

  double slotImageWidth = 60.0;
  double slotImageHeight = 60.0;
  Item head = Item(
    name: 'Mask of the Unforgiven',
    iLvl: 52,
    isBop: true,
    slot: 'Head',
    armorProficiency: 'Leather',
    armor: 132,
    stats: [
      '+12 Stamina',
    ],
    durability: 60,
    reqLvl: 52,
    effects: [
      'Equip: Improves your chance to hit by 2%.',
      'Equip: Improves your chance to get a critical strike by 1%.',
    ],
    gold: 1,
    silver: 58,
    copper: 95,
    dropped: 'The Unforgiven',
    imagePath: "inv_misc_bandana_01.jpg"
  );
  Item neck = Item(
    name: 'Mark of Fordring',
    iLvl: 63,
    isBop: true,
    slot: 'Neck',
    effects: [
      'Equip: Improves your chance to get a critical strike by 1%.',
      'Equip: +26 Attack Power.',
    ],
    gold: 1,
    silver: 2,
    copper: 83,
  );
  Item trinket2 = Item(
    name: "Royal Seal of Eldre'Thalas",
    iLvl: 62,
    isBop: true,
    unique: true,
    slot: 'Trinket',
    stats: [
      '+10 Fire Resistance',
    ],
    classes: [
      'Hunter',
    ],
    effects: [
      'Equip: +48 ranged Attack Power.',
    ],
    text: "Blessed by the Shen'dralar Ancients.",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: _itemSlots(),
                color: Colors.black,
              ),
            ),
          ],
      
      ),
    );
  }

  Widget _itemSlots() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: _getSlotImage('assets/mainhand.png'),
                  onTap: () => {},
                ),
                GestureDetector(
                  child: _getSlotImage('assets/offhand.png'),
                  onTap: () => {},
                ),
                GestureDetector(
                  child: _getSlotImage('assets/ranged.png'),
                  onTap: () => {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: _getSlotImage((phaseValue == null || classValue == null) ? "assets/head.png" : "assets/${head.imagePath}"),
                  onTap: () => {showFancyCustomDialog(context, head)},
                ),
                _getPhaseDropdown(),
                GestureDetector(
                  child: _getSlotImage('assets/hands.png'),
                  onTap: () => {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: _getSlotImage('assets/neck.png'),
                  onTap: () => {showFancyCustomDialog(context, neck)},
                ),
                _getClassDropdown(),
                GestureDetector(
                  child: _getSlotImage('assets/waist.png'),
                  onTap: () => {showFancyCustomDialog(context, neck)},
                ),
              ],
            ),
          ),
          Expanded(
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: _getSlotImage('assets/shoulder.png'),
                  onTap: () => {},
                ),
                _getClassSpecDropdown(),
                GestureDetector(
                  child: _getSlotImage('assets/legs.png'),
                  onTap: () => {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: _getSlotImage('assets/back.png'),
                  onTap: () => {},
                ),
                GestureDetector(
                  child: _getSlotImage('assets/feet.png'),
                  onTap: () => {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: _getSlotImage('assets/chest.png'),
                  onTap: () => {},
                ),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      child: _getSlotImage('assets/ring.png'),
                      onTap: () => {},
                    ),
                    GestureDetector(
                      child: _getSlotImage('assets/ring.png'),
                      onTap: () => {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: _getSlotImage('assets/wrist.png'),
                  onTap: () => {},
                ),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      child: _getSlotImage('assets/trinket.png'),
                      onTap: () => {},
                    ),
                    GestureDetector(
                      child: _getSlotImage('assets/trinket.png'),
                      onTap: () => {showFancyCustomDialog(context, trinket2)},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showFancyCustomDialog(BuildContext context, Item item) {
    Dialog fancyDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: GestureDetector(
        onTap: () => {Navigator.pop(context)},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
                color: Colors.black,
              ),
              width: 350.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.name,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          "Item Level ${item.iLvl}",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          item.bop,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        item.unique == null
                            ? Container()
                            : Text(
                                'Unique',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                        item.armorProficiency == null
                            ? Text(
                                item.slot,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              )
                            : Row(
                                children: <Widget>[
                                  Text(
                                    item.slot,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 48.0,
                                  ),
                                  Text(
                                    item.armorProficiency,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                        item.armor == null
                            ? Container()
                            : Text(
                                "${item.armor} Armor",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                        _getStats(item),
                        item.durability == null
                            ? Container()
                            : Text(
                                "Durability ${item.durability} / ${item.durability}",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                        _getClasses(item),
                        SizedBox(
                          height: 16.0,
                        ),
                        item.reqLvl == null
                            ? Container()
                            : Text(
                                "Requires Level ${item.reqLvl}",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                        _getEffects(item),
                        _getSellPrice(item),
                        item.dropped == null
                            ? Container()
                            : Text(
                                'Dropped by: The Unforgiven',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                        item.text == null
                            ? Container()
                            : Text(
                                "\"${item.text}\"",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.yellow,
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => fancyDialog);
  }

  Widget _getPhaseDropdown() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButton<String>(
          value: phaseValue,
          elevation: 16,
          hint: Text(
            'Select phase',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (String newValue) {
            setState(() {
              phaseValue = newValue;
            });
          },
          items: <String>['1 (pre-raid)', '2 (pre-raid)', '3', '4', '5', '6']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _getClassDropdown() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButton<String>(
          value: classValue,
          elevation: 16,
          hint: Text(
            'Select class',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (String newValue) {
            setState(() {
              classValue = newValue;
            });
          },
          items: <String>[
            'Druid',
            'Hunter',
            'Mage',
            'Paladin',
            'Priest',
            'Rogue',
            'Shaman',
            'Warlock',
            'Warrior'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _getClassSpecDropdown() {
    if (classValue == "Hunter" || classValue == "Mage" || classValue == "Warlock") {
      return Container();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButton<String>(
          value: specValue,
          elevation: 16,
          hint: Text(
            'Select spec',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (String newValue) {
            setState(() {
              specValue = newValue;
            });
          },
          items: <String>[
            'Holy',
            'Protection',
            'Retribution',
            'Feral Tank',
            'Feral Dps',
            'Restoration',
            'Balance',
            'Holy & Disc',
            'Shadow',
            'Elemental',
            'Enhancement'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _getSellPrice(Item item) {
    if (item.gold == null && item.silver == null && item.copper == null) {
      return Container();
    }

    return Row(
      children: <Widget>[
        Text(
          'Sell Price: ',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        Text(
          item.gold.toString(),
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 6.0),
          child: Image.asset('assets/money-gold.png'),
        ),
        Text(
          item.silver.toString(),
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 6.0),
          child: Image.asset('assets/money-silver.png'),
        ),
        Text(
          item.copper.toString(),
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Image.asset('assets/money-copper.png'),
        ),
      ],
    );
  }

  Widget _getStats(Item item) {
    if (item.stats == null) {
      return Container();
    }
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < item.stats.length; i++) {
      list.add(new Text(
        item.stats[i],
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ));
    }
    return new Column(
      children: list,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget _getClasses(Item item) {
    if (item.classes == null) {
      return Container();
    }
    return Text(
      "Classes: " + item.classes.join(', '),
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
      ),
    );
  }

  Widget _getEffects(Item item) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < item.effects.length; i++) {
      list.add(new Text(
        item.effects[i],
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.greenAccent[700],
        ),
      ));
    }
    return new Column(
      children: list,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget _getSlotImage(String path) {
    return Image.asset(
      path,
      height: 60.0,
      width: 60.0,
    );
  }
}
