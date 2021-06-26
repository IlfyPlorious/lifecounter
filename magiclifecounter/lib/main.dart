import 'package:flutter/material.dart';
import 'package:magiclifecounter/pages/four_players.dart';
import 'package:magiclifecounter/pages/instructions.dart';
import 'package:magiclifecounter/pages/main_menu.dart';
import 'package:magiclifecounter/pages/two_players.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/main_menu',
  routes: {
    '/main_menu' : (context) => MainMenu(),
    '/two_players' : (context) => TwoPlayers(),
    '/four_players' : (context) => FourPlayers(),
    '/instructions' : (context) => Instructions()
  },
  debugShowCheckedModeBanner: false,
));



