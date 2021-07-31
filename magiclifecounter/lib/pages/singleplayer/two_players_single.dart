import 'package:flutter/material.dart';
import 'package:magiclifecounter/classes/player.dart';
import 'package:magiclifecounter/layouts/player_layout.dart';
import 'package:magiclifecounter/layouts/stats_layout.dart';
import 'package:magiclifecounter/widgets/button_player_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TwoPlayers extends StatefulWidget {
  const TwoPlayers({Key? key}) : super(key: key);

  @override
  _TwoPlayersState createState() => _TwoPlayersState();
}

class _TwoPlayersState extends State<TwoPlayers> {

  Player player1 = Player(
      health: 40,
      username: 'player1',
      backgroundColor: Colors.green.shade700,
      healthColor: Colors.white,
      commanderDamage: [0,0,0,0,0,0],
      poisonDamage: 0,
      commanderDamageColor: Colors.white,
      poisonDamageColor: Colors.white,
      show: 'player',
      tooltipVisibility: 'invisible',
      timerIsRunning: false,
      tooltip: 0
  );
  Player player2 = Player(
      health: 40,
      username: 'player2',
      backgroundColor: Colors.green.shade700,
      healthColor: Colors.white,
      commanderDamage: [0,0,0,0,0,0],
      poisonDamage: 0,
      commanderDamageColor: Colors.white,
      poisonDamageColor: Colors.white,
      show: 'player',
      tooltipVisibility: 'invisible',
      timerIsRunning: false,
      tooltip: 0
  );


  @override
  void initState() {
    super.initState();
    getSharedPrefs();
  }

  getSharedPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if ( prefs.getInt('player1_health') != null ) player1.health = prefs.getInt('player1_health')!;
      if ( prefs.getInt('player1_comm_damage') != null ) player1.commanderDamage[1] = prefs.getInt('player1_comm_damage')!;
      if ( prefs.getInt('player1_poison_damage') != null ) player1.poisonDamage = prefs.getInt('player1_poison_damage')!;
      if ( prefs.getInt('player2_health') != null ) player2.health = prefs.getInt('player2_health')!;
      if ( prefs.getInt('player2_comm_damage') != null ) player2.commanderDamage[0] = prefs.getInt('player2_comm_damage')!;
      if ( prefs.getInt('player2_poison_damage') != null ) player2.poisonDamage = prefs.getInt('player2_poison_damage')!;
      if ( prefs.getString('player2_background_color') != null ) setPlayerBackground( player2, prefs.getString('player2_background_color')!);
      if ( prefs.getString('player1_background_color') != null ) setPlayerBackground( player1, prefs.getString('player1_background_color')!);
      if ( prefs.getString('player1_username') != null ) player1.username = prefs.getString('player1_username')!;
      if ( prefs.getString('player2_username') != null ) player2.username = prefs.getString('player2_username')!;
    });

  }

  setPlayerBackground( Player player, String color ){
   if ( color == Colors.red.toString() ) player.backgroundColor = Colors.red;
   if ( color == Colors.green.shade700.toString()) player.backgroundColor = Colors.green.shade700;
   if ( color == Colors.blue.toString()) player.backgroundColor = Colors.blue;
   if ( color == Colors.grey.shade900.toString()) player.backgroundColor = Colors.grey.shade900;
   if ( color == Color.fromRGBO(252, 243, 207, 1).toString()) player.backgroundColor = Color.fromRGBO(252, 243, 207, 1);
  }

  @override
  void dispose() {
    super.dispose();
    setSharedPrefs();
  }

  setSharedPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('player1_health', player1.health);
    await prefs.setInt('player1_comm_damage', player1.commanderDamage[1]);
    await prefs.setInt('player1_poison_damage', player1.poisonDamage);
    await prefs.setInt('player2_health', player2.health);
    await prefs.setInt('player2_comm_damage', player2.commanderDamage[0]);
    await prefs.setInt('player2_poison_damage', player2.poisonDamage);
    await prefs.setString('player2_background_color', player2.backgroundColor.toString());
    await prefs.setString('player1_background_color', player1.backgroundColor.toString());
    await prefs.setString('player1_username', player1.username.toString());
    await prefs.setString('player2_username', player2.username.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: RotatedBox(
                  child: (player1.show == 'player') ? PlayerLayout(
                    player: player1,
                    notifyParent: refreshPlayer1,
                  ) : StatsLayout(
                      player: player1,
                      notifyParent: refreshStatsPlayer1,
                      onBackPressed: onStatsBackPressed,
                      playerIndex: 0,
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
                    notifyParent: refreshStatsPlayer2,
                    onBackPressed: onStatsBackPressed,
                    playerIndex: 1,
                ),
                flex: 1,
              ),
            ],

            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ),
        onHorizontalDragUpdate: (details){
         if ( details.delta.dx > 7 ) Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.grey.shade900,
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

  void refreshStatsPlayer1( Player player ){

    setState(() {
      player1 = player;
    });

  }

  void refreshStatsPlayer2( Player player ){

    setState(() {
     player2 = player;
    });

  }

  void onStatsBackPressed(Player player){
    setState(() {
      player.show = 'player';
    });
  }

}
