import 'package:flutter/material.dart';
import 'package:magiclifecounter/classes/player.dart';
import 'package:magiclifecounter/layouts/player_layout.dart';
import 'package:magiclifecounter/layouts/stats_layout.dart';
import 'package:magiclifecounter/widgets/button_player_bar.dart';

class TwoPlayers extends StatefulWidget {
  const TwoPlayers({Key? key}) : super(key: key);

  @override
  _TwoPlayersState createState() => _TwoPlayersState();
}

class _TwoPlayersState extends State<TwoPlayers> {

  Player player1 = Player(health: 40,
      username: '',
      backgroundColor: Colors.green.shade700,
      healthColor: Colors.white,
      commanderDamage: 0,
      poisonDamage: 0,
      commanderDamageColor: Colors.white,
      poisonDamageColor: Colors.white,
      show: 'player',
      tooltipVisibility: 'invisible',
      tooltip: 0
  );
  Player player2 = Player(health: 40,
      username: '',
      backgroundColor: Colors.green.shade700,
      healthColor: Colors.white,
      commanderDamage: 0,
      poisonDamage: 0,
      commanderDamageColor: Colors.white,
      poisonDamageColor: Colors.white,
      show: 'player',
      tooltipVisibility: 'invisible',
      tooltip: 0
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: RotatedBox(
                child: (player1.show == 'player') ? PlayerLayout(
                  player: player1,
                  notifyParent: refreshPlayer1,
                ) : StatsLayout(
                    player: player1,
                    notifyParent: refreshStatsPlayer1
                ),
                quarterTurns: 2,
              ),
              flex: 1,
            ),
            Expanded(
              child: (player2.show == 'player') ? PlayerLayout(
                player: player2,
                notifyParent: refreshPlayer2,
              ) : StatsLayout(
                  player: player2,
                  notifyParent: refreshStatsPlayer2 ),
              flex: 1,
            ),
          ],

          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }

  void refreshPlayer1( int health, Color healthColor, Color backgroundColor, String show ){
    setState(() {
      player1.health = health;
      player1.healthColor = healthColor;
      player1.backgroundColor = backgroundColor;
      player1.show = show;
    });
  }

  void refreshPlayer2( int health, Color healthColor, Color backgroundColor, String show ){
    setState(() {
      player2.health = health;
      player2.healthColor = healthColor;
      player2.backgroundColor = backgroundColor;
      player2.show = show;
    });
  }

  dynamic refreshStatsPlayer1( {required int commanderDamage, required int poisonDamage, required String show }){

    setState(() {
      player1.commanderDamage = commanderDamage;
      player1.poisonDamage = poisonDamage;
      player1.show = show;
    });

  }

  void refreshStatsPlayer2( {required int commanderDamage, required int poisonDamage, required String show }){

    setState(() {
      player2.commanderDamage = commanderDamage;
      player2.poisonDamage = poisonDamage;
      player2.show = show;
    });

  }

}
