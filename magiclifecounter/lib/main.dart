import 'package:flutter/material.dart';
import 'package:magiclifecounter/pages/multiplayer/comm/register_page.dart';
import 'package:magiclifecounter/pages/multiplayer/comm/signin_page.dart';
import 'package:magiclifecounter/pages/multiplayer/four_players_multi.dart';
import 'package:magiclifecounter/pages/multiplayer/two_players_multi.dart';
import 'package:magiclifecounter/pages/singleplayer/four_players_single.dart';
import 'package:magiclifecounter/pages/instructions.dart';
import 'package:magiclifecounter/pages/main_menu.dart';
import 'package:magiclifecounter/pages/singleplayer/two_players_single.dart';

void main() async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/main_menu',
      routes: {
        '/main_menu' : (context) => MainMenu(),
        '/two_players' : (context) => TwoPlayers(),
        '/four_players' : (context) => FourPlayers(),
        '/instructions' : (context) => Instructions(),
        '/sign_in' : (context) => SignIn(),
        '/register' : (context) => Register(),
        '/four_players_multi' : (context) => FourPlayersMulti(),
        '/two_players_multi' : (context) => TwoPlayersMulti(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}




