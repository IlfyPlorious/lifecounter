import 'package:flutter/material.dart';
import 'package:magiclifecounter/classes/player.dart';

class PlayerBar extends StatefulWidget {

  String mode;
  final Function(int health, Color color, Color bgColor, String show) notifyParent;
  Player player;

  PlayerBar({Key? key, required this.mode, required this.player, required this.notifyParent}) : super(key: key);

  @override
  _PlayerBarState createState() => _PlayerBarState();
}

class _PlayerBarState extends State<PlayerBar> {

  @override
  Widget build(BuildContext context) {
    if ( widget.mode == 'default' )
      return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: (){

                  setState(() {
                    widget.player.health = 40;
                    widget.player.healthColor = Colors.white;
                    widget.notifyParent( 40, Colors.white, widget.player.backgroundColor, widget.player.show );
                  });
                },
                icon: Image(
                  image: AssetImage('./lib/assets/icons/lifereset.png'),
                ),
                iconSize: 50,
              ),
              IconButton(
                onPressed: () {
                  widget.player.show = 'stats';
                  widget.notifyParent(widget.player.health, widget.player.healthColor, widget.player.backgroundColor, 'stats');
                },
                icon: Image(
                  image: AssetImage('./lib/assets/icons/statsbar48.png'),
                ),
                iconSize: 50,
              ),
              IconButton(
                onPressed: (){
                  setState(() {
                    widget.mode = 'chooseBgColor';
                  });
                },
                icon: Image(
                  image: AssetImage('./lib/assets/icons/color64.png'),
                ),
                iconSize: 50,
              ),
            ],
      );
    else return Row(
        children: [
          Expanded(
            child: IconButton(onPressed: (){
              widget.notifyParent(widget.player.health, widget.player.healthColor, Colors.red, widget.player.show);
              setState(() {
                widget.mode = 'default';
              });
            }, icon: Image(image: AssetImage('./lib/assets/icons/fire48.png'),), iconSize: 50,),
          ),
          Expanded(
            child: IconButton(onPressed: (){
              widget.notifyParent(widget.player.health, widget.player.healthColor, Colors.blue, widget.player.show);
              setState(() {
                widget.mode = 'default';
              });
            }, icon: Image(image: AssetImage('./lib/assets/icons/water48.png'),), iconSize: 50,),
          ),
          Expanded(
            child: IconButton(onPressed: (){
              widget.notifyParent(widget.player.health, widget.player.healthColor, Colors.green.shade700, widget.player.show );
              setState(() {
                widget.mode = 'default';
              });
            }, icon: Image(image: AssetImage('./lib/assets/icons/forest48.png'),), iconSize: 50,),
          ),
          Expanded(
            child: IconButton(onPressed: (){
              widget.notifyParent(widget.player.health, widget.player.healthColor, Color.fromRGBO(252, 243, 207, 1), widget.player.show);
              setState(() {
                widget.mode = 'default';
              });
            }, icon: Image(image: AssetImage('./lib/assets/icons/sun48.png'),), iconSize: 50,),
          ),
          Expanded(
            child: IconButton(onPressed: (){
              widget.notifyParent(widget.player.health, widget.player.healthColor, Colors.grey.shade900, widget.player.show);
              setState(() {
                widget.mode = 'default';
              });
            }, icon: Image(image: AssetImage('./lib/assets/icons/swamp48.png'),), iconSize: 50,),
          ),
        ],

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
