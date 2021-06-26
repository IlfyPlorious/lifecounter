import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Player{

  int health;
  int commanderDamage;
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

  void plusCommanderDamage(){
    this.commanderDamage += 1;
  }

  void minusCommanderDamage(){
    this.commanderDamage -= 1;
  }

  void plusPoisonDamage(){
    this.poisonDamage += 1;
  }

  void minusPoisonDamage(){
    this.poisonDamage -= 1;
  }

  void changeUsername(String username){
    this.username = username;
  }

  void changeBackgroundColor( Color bgColor ){
    this.backgroundColor = bgColor;
  }
}
