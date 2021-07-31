import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Player{

  int health;
  var commanderDamage = List<int>.filled(6, 0);
  int poisonDamage;
  String username, show;
  Color backgroundColor;
  Color healthColor;
  Color commanderDamageColor, poisonDamageColor;
  String tooltipVisibility;
  int tooltip;
  bool timerIsRunning;

  Player({ required this.health,
    required this.commanderDamage,
    required this.poisonDamage,
    required this.username,
    required this.backgroundColor,
    required this.healthColor,
    required this.commanderDamageColor,
    required this.poisonDamageColor,
    required this.show,
    required this.tooltipVisibility,
    required this.timerIsRunning,
    required this.tooltip
  });

  void plusHealth() {
    this.health += 1;
  }

  void minusHealth(){
    this.health -= 1;
  }

  void plusCommanderDamage({required int whereIndex}){
    if ( commanderDamage[whereIndex] + 1 < 22 )
      this.commanderDamage[whereIndex] += 1;
  }

  void minusCommanderDamage({required int whereIndex}){
    if ( commanderDamage[whereIndex] - 1 > -1 )
      this.commanderDamage[whereIndex] -= 1;
  }

  void resetCommanderDamage({required int whereIndex}){
    this.commanderDamage[whereIndex] = 0;
  }

  void plusPoisonDamage(){
    if ( poisonDamage + 1 < 11)
      this.poisonDamage += 1;
  }

  void minusPoisonDamage(){
    if ( poisonDamage - 1 > -1 )
      this.poisonDamage -= 1;
  }

  void changeUsername(String username){
    this.username = username;
  }

  void changeBackgroundColor( Color bgColor ){
    this.backgroundColor = bgColor;
  }
}
