import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magiclifecounter/classes/player.dart';
import 'package:magiclifecounter/widgets/button_player_bar.dart';

class PlayerLayout extends StatefulWidget {

  PlayerLayout({Key? key, required this.player, required this.notifyParent}) : super(key: key);

  Player player;
  final Function(int health, Color color, Color bgColor, String show) notifyParent;

  @override
  _PlayerLayoutState createState() => _PlayerLayoutState();
}

class _PlayerLayoutState extends State<PlayerLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(child: PlayerBar(
              mode: 'default',
              player: widget.player,
              notifyParent: widget.notifyParent,
            ), flex: 1,),

            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: IconButton(onPressed: () {
                    setState(() {
                      widget.player.health -= 1;
                      if ( widget.player.health < 1 ) widget.player.healthColor = Colors.deepOrange.shade900;
                      else widget.player.healthColor = Colors.white;
                    });
                  },
                      icon: Image(
                        image: AssetImage('icons/orangeminus32.png'),
                      )
                  ),
                ),
                Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text((widget.player.tooltip > -1 ) ? '+' + widget.player.tooltip.toString() : widget.player.tooltip.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                      ),
                    ),
                    Text(widget.player.health.toString(),
                      style: TextStyle(
                          fontSize: 70,
                          color: widget.player.healthColor,
                          shadows: <Shadow> [
                            Shadow(
                              blurRadius: 5
                            )
                          ]
                      ),),
                  ],
                )),
                Expanded(
                  child: IconButton(onPressed: (){
                    setState(() {
                      widget.player.health += 1;
                      if ( widget.player.health < 1 ) widget.player.healthColor = Colors.deepOrange.shade900;
                      else widget.player.healthColor = Colors.white;
                    });
                  },
                      icon: Image( image: AssetImage('icons/greenplus32.png'), )
                  ),
                )
              ],
            ), flex: 3,),
          ],
        ),
      ),
      color: widget.player.backgroundColor,
    );
  }

  void healthTooltipTimer() async{
    //Timer()
  }

}
