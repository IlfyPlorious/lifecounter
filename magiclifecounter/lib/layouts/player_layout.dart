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

  Timer _timer = new Timer(Duration(seconds: 0), (){});


  @override
  void dispose() {
    _timer.cancel();
    widget.player.tooltipVisibility = 'invisible';
    widget.player.tooltip = 0;
    super.dispose();
  }

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

                      if ( widget.player.tooltipVisibility == 'invisible') {
                        widget.player.tooltip -= 1;
                        setTooltipVisible();
                        if (_timer != null ){
                          _timer.cancel();
                          _timer = new Timer(Duration(seconds: 2), setTooltipInvisible);
                        }
                      } else {
                        if (_timer != null ){
                          _timer.cancel();
                          _timer = new Timer(Duration(seconds: 2), setTooltipInvisible);
                        }
                        widget.player.tooltip -= 1;
                      }

                    });



                  },
                      icon: Image(
                        image: AssetImage('./lib/assets/icons/orangeminus32.png'),
                      )
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      child: Text((widget.player.tooltip > -1 ) ? '+' + widget.player.tooltip.toString() : widget.player.tooltip.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 5
                              )
                            ],
                        ),
                      ),
                      opacity: ( widget.player.tooltipVisibility == 'visible') ? 1 : 0,
                      duration: ( widget.player.tooltipVisibility == 'visible') ? Duration(milliseconds: 1) : Duration(milliseconds: 500),
                      onEnd: (){
                        if ( widget.player.tooltipVisibility == 'invisible' ) widget.player.tooltip = 0;
                      },
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
                ),
                Expanded(
                  child: IconButton(onPressed: (){
                    setState(() {
                      widget.player.health += 1;
                      if ( widget.player.health < 1 ) widget.player.healthColor = Colors.deepOrange.shade900;
                      else widget.player.healthColor = Colors.white;
                    });

                    if ( widget.player.tooltipVisibility == 'invisible') {
                      setTooltipVisible();
                      if (_timer != null ){
                        _timer.cancel();
                        _timer = new Timer(Duration(seconds: 2), setTooltipInvisible);
                      }
                      widget.player.tooltip += 1;
                    } else {
                      if (_timer != null ){
                        _timer.cancel();
                        _timer = new Timer(Duration(seconds: 2), setTooltipInvisible);
                      }
                      widget.player.tooltip += 1;
                    }
                  },
                      icon: Image( image: AssetImage('./lib/assets/icons/greenplus32.png'), ),
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

  void setTooltipInvisible(){
     setState(() {
       widget.player.tooltipVisibility = 'invisible';
     });
  }

  void setTooltipVisible(){
      setState(() {
        widget.player.tooltipVisibility = 'visible';
      });
  }

}
