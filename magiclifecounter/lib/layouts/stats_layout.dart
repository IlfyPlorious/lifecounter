import 'package:flutter/material.dart';
import 'package:magiclifecounter/classes/player.dart';

class StatsLayout extends StatefulWidget {

  Player player;
  Function({ required int commanderDamage, required int poisonDamage, required String show}) notifyParent;

  StatsLayout({Key? key, required this.player, required this.notifyParent}) : super(key: key);

  @override
  _StatsLayoutState createState() => _StatsLayoutState();
}

class _StatsLayoutState extends State<StatsLayout> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: IconButton(onPressed: (){
                    widget.player.show = 'player';
                    widget.notifyParent( commanderDamage: widget.player.commanderDamage, poisonDamage: widget.player.poisonDamage, show: widget.player.show );
                  }, icon: Image( image: AssetImage('./lib/assets/icons/back48white.png'),),
                  iconSize: 20,
                  ),
                ),
                Padding(padding: const EdgeInsets.all(12.0),
                child: IconButton(onPressed: (){
                  setState(() {
                    widget.player.commanderDamage = 0;
                    widget.player.poisonDamage = 0;
                    widget.notifyParent( commanderDamage: widget.player.commanderDamage, poisonDamage: widget.player.poisonDamage, show: widget.player.show );
                  });
                },
                  icon: Image(image: AssetImage('./lib/assets/icons/liferesetwhite.png'),),
                  iconSize: 20,
                ),
                )
              ],
            ),
            flex: 3,
          ),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Commander Damage',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber
                ),
              )
            ],
          ),
            flex: 1,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(onPressed: (){
                    setState(() {
                      widget.player.commanderDamage -= 1;
                      if ( widget.player.commanderDamage > 20 )
                          widget.player.commanderDamageColor = Colors.deepOrange.shade900;
                      else widget.player.commanderDamageColor = Colors.white;
                    });
                    widget.notifyParent(commanderDamage: widget.player.commanderDamage, poisonDamage: widget.player.poisonDamage, show: widget.player.show);
                  }, icon: Image(image: AssetImage('./lib/assets/icons/orangeminus32.png'),),
                  ),
                ),
                Center(
                  child: Text(widget.player.commanderDamage.toString(),
                  style: TextStyle(
                    fontSize: 30,
                    color: widget.player.commanderDamageColor
                  ),),
                ), 
                Expanded(
                  child: IconButton(onPressed: (){
                    setState(() {
                      widget.player.commanderDamage += 1;
                      if ( widget.player.commanderDamage > 20 )
                        widget.player.commanderDamageColor = Colors.deepOrange.shade900;
                      else widget.player.commanderDamageColor = Colors.white;
                    });
                    widget.notifyParent(commanderDamage: widget.player.commanderDamage, poisonDamage: widget.player.poisonDamage, show: widget.player.show);
                  }, icon: Image(image: AssetImage('./lib/assets/icons/greenplus32.png'),)),
                )
              ],
            ),
            flex: 3,
          ),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('Poison Damage',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green
                  ),
                ),
              )
            ],
          ),
            flex: 1,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: IconButton(onPressed: (){
                  setState(() {
                    widget.player.poisonDamage -= 1;
                    if ( widget.player.poisonDamage > 10 )
                      widget.player.poisonDamageColor = Colors.deepOrange.shade900;
                    else widget.player.poisonDamageColor = Colors.white;
                  });
                  widget.notifyParent(commanderDamage: widget.player.commanderDamage, poisonDamage: widget.player.poisonDamage, show: widget.player.show);
                }, icon: Image(image: AssetImage('./lib/assets/icons/orangeminus32.png'),))),
                Center(
                  child: Text(widget.player.poisonDamage.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        color: widget.player.poisonDamageColor
                    ),),
                ),
                Expanded(child: IconButton(onPressed: (){
                  setState(() {
                    widget.player.poisonDamage += 1;
                    if ( widget.player.poisonDamage > 10 )
                      widget.player.poisonDamageColor = Colors.deepOrange.shade900;
                    else widget.player.poisonDamageColor = Colors.white;
                  });
                  widget.notifyParent(commanderDamage: widget.player.commanderDamage, poisonDamage: widget.player.poisonDamage, show: widget.player.show);
                }, icon: Image(image: AssetImage('./lib/assets/icons/greenplus32.png'),)))
              ],
            ),
            flex: 3,
          )
        ],
      ),
      color: Colors.grey.shade800,
    );
  }
}
