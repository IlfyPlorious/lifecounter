import 'package:flutter/material.dart';
import 'package:magiclifecounter/classes/player.dart';
import 'package:magiclifecounter/layouts/player_layout.dart';
import 'package:magiclifecounter/layouts/stats_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FourPlayers extends StatefulWidget {
  const FourPlayers({Key? key}) : super(key: key);

  @override
  _FourPlayersState createState() => _FourPlayersState();
}

class _FourPlayersState extends State<FourPlayers> {

  Player player1 = new Player(
      health: 40,
      username: '',
      backgroundColor: Colors.green.shade700,
      healthColor: Colors.white,
      commanderDamage: 0,
      poisonDamage: 0,
      commanderDamageColor: Colors.white,
      poisonDamageColor: Colors.white,
      show: 'player',
      tooltipVisibility: 'invisible',
      timerIsRunning: false,
      tooltip: 0,
  );

  Player player2 = new Player(
    health: 40,
    username: '',
    backgroundColor: Colors.green.shade700,
    healthColor: Colors.white,
    commanderDamage: 0,
    poisonDamage: 0,
    commanderDamageColor: Colors.white,
    poisonDamageColor: Colors.white,
    show: 'player',
    tooltipVisibility: 'invisible',
    timerIsRunning: false,
    tooltip: 0,
  );

  Player player3 = new Player(
    health: 40,
    username: '',
    backgroundColor: Colors.green.shade700,
    healthColor: Colors.white,
    commanderDamage: 0,
    poisonDamage: 0,
    commanderDamageColor: Colors.white,
    poisonDamageColor: Colors.white,
    show: 'player',
    tooltipVisibility: 'invisible',
    timerIsRunning: false,
    tooltip: 0,
  );

  Player player4 = new Player(
    health: 40,
    username: '',
    backgroundColor: Colors.green.shade700,
    healthColor: Colors.white,
    commanderDamage: 0,
    poisonDamage: 0,
    commanderDamageColor: Colors.white,
    poisonDamageColor: Colors.white,
    show: 'player',
    tooltipVisibility: 'invisible',
    timerIsRunning: false,
    tooltip: 0,
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
      if ( prefs.getInt('player1_comm_damage') != null ) player1.commanderDamage = prefs.getInt('player1_comm_damage')!;
      if ( prefs.getInt('player1_poison_damage') != null ) player1.poisonDamage = prefs.getInt('player1_poison_damage')!;
      if ( prefs.getString('player1_background_color') != null ) setPlayerBackground( player1, prefs.getString('player1_background_color')!);
      if ( prefs.getInt('player2_health') != null ) player2.health = prefs.getInt('player2_health')!;
      if ( prefs.getInt('player2_comm_damage') != null ) player2.commanderDamage = prefs.getInt('player2_comm_damage')!;
      if ( prefs.getInt('player2_poison_damage') != null ) player2.poisonDamage = prefs.getInt('player2_poison_damage')!;
      if ( prefs.getString('player2_background_color') != null ) setPlayerBackground( player2, prefs.getString('player2_background_color')!);
      if ( prefs.getInt('player3_health') != null ) player3.health = prefs.getInt('player3_health')!;
      if ( prefs.getInt('player3_comm_damage') != null ) player3.commanderDamage = prefs.getInt('player3_comm_damage')!;
      if ( prefs.getInt('player3_poison_damage') != null ) player3.poisonDamage = prefs.getInt('player3_poison_damage')!;
      if ( prefs.getString('player3_background_color') != null ) setPlayerBackground( player3, prefs.getString('player3_background_color')!);
      if ( prefs.getInt('player4_health') != null ) player4.health = prefs.getInt('player4_health')!;
      if ( prefs.getInt('player4_comm_damage') != null ) player4.commanderDamage = prefs.getInt('player4_comm_damage')!;
      if ( prefs.getInt('player4_poison_damage') != null ) player4.poisonDamage = prefs.getInt('player4_poison_damage')!;
      if ( prefs.getString('player4_background_color') != null ) setPlayerBackground( player4, prefs.getString('player4_background_color')!);

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
    await prefs.setInt('player1_comm_damage', player1.commanderDamage);
    await prefs.setInt('player1_poison_damage', player1.poisonDamage);
    await prefs.setString('player1_background_color', player1.backgroundColor.toString());
    await prefs.setInt('player2_health', player2.health);
    await prefs.setInt('player2_comm_damage', player2.commanderDamage);
    await prefs.setInt('player2_poison_damage', player2.poisonDamage);
    await prefs.setString('player2_background_color', player2.backgroundColor.toString());
    await prefs.setInt('player3_health', player3.health);
    await prefs.setInt('player3_comm_damage', player3.commanderDamage);
    await prefs.setInt('player3_poison_damage', player3.poisonDamage);
    await prefs.setString('player3_background_color', player3.backgroundColor.toString());
    await prefs.setInt('player4_health', player4.health);
    await prefs.setInt('player4_comm_damage', player4.commanderDamage);
    await prefs.setInt('player4_poison_damage', player4.poisonDamage);
    await prefs.setString('player4_background_color', player4.backgroundColor.toString());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        quarterTurns: 1,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: RotatedBox(
                        child: (player2.show == 'player') ? PlayerLayout(
                          player: player2,
                          notifyParent: refreshPlayer2,
                        ) : StatsLayout(
                            player: player2,
                            notifyParent: refreshStatsPlayer2 ),
                        quarterTurns: 1,
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: RotatedBox(
                        child: (player3.show == 'player') ? PlayerLayout(
                          player: player3,
                          notifyParent: refreshPlayer3,
                        ) : StatsLayout(
                            player: player3,
                            notifyParent: refreshStatsPlayer3
                        ),
                        quarterTurns: 3,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: RotatedBox(
                        child: (player4.show == 'player') ? PlayerLayout(
                          player: player4,
                          notifyParent: refreshPlayer4,
                        ) : StatsLayout(
                            player: player4,
                            notifyParent: refreshStatsPlayer4 ),
                        quarterTurns: 3,
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onHorizontalDragUpdate: (details) {
          if ( details.delta.dx > 7) Navigator.pop(context);
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

  void refreshPlayer3( int health, Color healthColor, Color backgroundColor, String show ){
    setState(() {
      player3.health = health;
      player3.healthColor = healthColor;
      player3.backgroundColor = backgroundColor;
      player3.show = show;
    });
  }

  void refreshPlayer4( int health, Color healthColor, Color backgroundColor, String show ){
    setState(() {
      player4.health = health;
      player4.healthColor = healthColor;
      player4.backgroundColor = backgroundColor;
      player4.show = show;
    });
  }

  void refreshStatsPlayer1( {required int commanderDamage, required int poisonDamage, required String show }){

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

  void refreshStatsPlayer3( {required int commanderDamage, required int poisonDamage, required String show }){

    setState(() {
      player3.commanderDamage = commanderDamage;
      player3.poisonDamage = poisonDamage;
      player3.show = show;
    });

  }

  void refreshStatsPlayer4( {required int commanderDamage, required int poisonDamage, required String show }){

    setState(() {
      player4.commanderDamage = commanderDamage;
      player4.poisonDamage = poisonDamage;
      player4.show = show;
    });

  }

}
