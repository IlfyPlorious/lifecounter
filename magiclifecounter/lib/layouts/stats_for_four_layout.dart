import 'package:flutter/material.dart';
import 'package:magiclifecounter/classes/player.dart';
import 'package:magiclifecounter/widgets/edit_text.dart';


class StatsForFour extends StatefulWidget {

  Player player;
  Function(Player player) onBackPressed;
  List<Player> thePlayers;

  StatsForFour({Key? key, required this.player, required this.onBackPressed, required this.thePlayers}) : super(key: key);

  @override
  _StatsForFourState createState() => _StatsForFourState();
}

class _StatsForFourState extends State<StatsForFour> {

  bool _editUsername = false;

  @override
  Widget build(BuildContext context) {

    var damageFromPlayer = widget.player.commanderDamage;

    return Container(
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,0,0),
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
              ],
            ),
            flex: 1,
          ),
          Expanded(child: Row(
            children: [
              Expanded(
                child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                child: Text(
                                  widget.thePlayers[0].username,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onTap: (){
                                setState(() {
                                  widget.player.resetCommanderDamage(whereIndex: 0);
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                child: Text(
                                  widget.thePlayers[1].username,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),),
                              ),
                              onTap: (){
                                setState(() {
                                  widget.player.resetCommanderDamage(whereIndex: 1);
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                child: Text(
                                  widget.thePlayers[2].username,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onTap: (){
                                setState(() {
                                  widget.player.resetCommanderDamage(whereIndex: 2);
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                child: Text(
                                  widget.thePlayers[3].username,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onTap: (){
                                setState(() {
                                  widget.player.resetCommanderDamage(whereIndex: 3);
                                });
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
              ),

                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: (){
                                  setState(() {
                                    //damageFromPlayer[0] -= 1;
                                    widget.player.minusCommanderDamage(whereIndex: 0);
                                  });
                                },
                                icon: Image(image: AssetImage('./lib/assets/icons/orangeminus32.png'),)
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child: Text(
                                damageFromPlayer[0].toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: (){
                                  setState(() {
                                    //damageFromPlayer[0] += 1;
                                    widget.player.plusCommanderDamage(whereIndex: 0);
                                  });
                                },
                                icon: Image(image: AssetImage('./lib/assets/icons/greenplus32.png')),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: (){
                                  setState(() {
                                    //damageFromPlayer[1] -= 1;
                                    widget.player.minusCommanderDamage(whereIndex: 1);
                                  });
                                },
                                icon: Image(image: AssetImage('./lib/assets/icons/orangeminus32.png'),)
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child: Text(
                              damageFromPlayer[1].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            ),
                            ),
                            IconButton(
                              onPressed: (){
                                setState(() {
                                  //damageFromPlayer[1] += 1;
                                  widget.player.plusCommanderDamage(whereIndex: 1);
                                });
                              },
                              icon: Image(image: AssetImage('./lib/assets/icons/greenplus32.png')),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: (){
                                  setState(() {
                                    //damageFromPlayer[2] -= 1;
                                    widget.player.minusCommanderDamage(whereIndex: 2);
                                  });
                                },
                                icon: Image(image: AssetImage('./lib/assets/icons/orangeminus32.png'),)
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child: Text(
                              damageFromPlayer[2].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            ),
                            ),
                            IconButton(
                              onPressed: (){
                                setState(() {
                                  //damageFromPlayer[2] += 1;
                                  widget.player.plusCommanderDamage(whereIndex: 2);
                                });
                              },
                              icon: Image(image: AssetImage('./lib/assets/icons/greenplus32.png')),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: (){
                                  setState(() {
                                    //damageFromPlayer[3] -= 1;
                                    widget.player.minusCommanderDamage(whereIndex: 3);
                                  });
                                },
                                icon: Image(image: AssetImage('./lib/assets/icons/orangeminus32.png'),)
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child: Text(
                              damageFromPlayer[3].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            ),
                            ),
                            IconButton(
                              onPressed: (){
                                setState(() {
                                 // damageFromPlayer[3] += 1;
                                  widget.player.plusCommanderDamage(whereIndex: 3);
                                });
                              },
                              icon: Image(image: AssetImage('./lib/assets/icons/greenplus32.png')),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
            flex: 3,
          ),
        ],
      ),
      color: Colors.grey.shade800,
    );;
  }

  void changeState( String username ){
    setState(() {
      _editUsername = !_editUsername;
      widget.player.username = username;
    });
  }
}
