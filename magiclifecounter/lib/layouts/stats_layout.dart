import 'package:flutter/material.dart';
import 'package:magiclifecounter/classes/player.dart';
import 'package:magiclifecounter/widgets/edit_text.dart';

class StatsLayout extends StatefulWidget {

  Player player;
  int playerIndex;
  Function(Player player) notifyParent;
  Function(Player player) onBackPressed;

  StatsLayout({Key? key, required this.player, required this.notifyParent, required this.playerIndex, required this.onBackPressed}) : super(key: key);

  @override
  _StatsLayoutState createState() => _StatsLayoutState();
}

class _StatsLayoutState extends State<StatsLayout> {

  bool _editUsername = false;

  @override
  Widget build(BuildContext context) {

    int com = (widget.playerIndex == 0 ) ? widget.player.commanderDamage[1] : widget.player.commanderDamage[0];

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
                    widget.onBackPressed(widget.player);
                  }, icon: Image( image: AssetImage('./lib/assets/icons/back48white.png'),),
                  iconSize: 20,
                  ),
                ),
                DynamicEditText(
                    player: widget.player,
                    state: _editUsername,
                    changeState: changeState,
                ),
                Padding(padding: const EdgeInsets.all(12.0),
                child: IconButton(onPressed: (){
                  setState(() {
                    if ( widget.playerIndex == 0 ) widget.player.resetCommanderDamage(whereIndex: 1);
                    else widget.player.resetCommanderDamage(whereIndex: 0);
                    widget.notifyParent( widget.player );
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
                      if ( widget.playerIndex == 0 ) {
                        widget.player.commanderDamage[1] -= 1;
                        if (widget.player.commanderDamage[1] > 20)
                          widget.player.commanderDamageColor =
                              Colors.deepOrange.shade900;
                        else
                          widget.player.commanderDamageColor = Colors.white;
                      } else {
                        widget.player.commanderDamage[0] -= 1;
                        if (widget.player.commanderDamage[0] > 20)
                          widget.player.commanderDamageColor =
                              Colors.deepOrange.shade900;
                        else
                          widget.player.commanderDamageColor = Colors.white;
                      }
                    });
                    widget.notifyParent(widget.player);
                  }, icon: Image(image: AssetImage('./lib/assets/icons/orangeminus32.png'),),
                  ),
                ),
                Center(
                  child: Text(com.toString(),
                  style: TextStyle(
                    fontSize: 30,
                    color: widget.player.commanderDamageColor
                  ),),
                ), 
                Expanded(
                  child: IconButton(onPressed: (){
                    setState(() {
                      if ( widget.playerIndex == 0 ) {
                        widget.player.commanderDamage[1] += 1;
                        if (widget.player.commanderDamage[1] > 20)
                          widget.player.commanderDamageColor =
                              Colors.deepOrange.shade900;
                        else
                          widget.player.commanderDamageColor = Colors.white;
                      } else {
                        widget.player.commanderDamage[0] += 1;
                        if (widget.player.commanderDamage[0] > 20)
                          widget.player.commanderDamageColor =
                              Colors.deepOrange.shade900;
                        else
                          widget.player.commanderDamageColor = Colors.white;
                      }
                    });
                    widget.notifyParent(widget.player);
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
                  widget.notifyParent(widget.player);
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
                  widget.notifyParent(widget.player);
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

  void changeState( String username ){
    setState(() {
      _editUsername = !_editUsername;
      widget.player.username = username;
    });
  }
}
