import 'package:flutter/material.dart';
import 'package:magiclifecounter/classes/player.dart';

class DynamicEditText extends StatelessWidget {

  DynamicEditText({
    Key? key,
    required this.player,
    this.state = true,
    required this.changeState,
  }) : super(key: key);

  Player player;
  bool state;
  Function( String username ) changeState;

  @override
  Widget build(BuildContext context) {

    String newUsername = player.username;

    return (!state) ? Row(
      children: [
        Text( player.username,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: IconButton(
            onPressed: (){
              changeState(newUsername);
            },
            icon: Image(image: AssetImage('./lib/assets/icons/edit_icon.png')),
            iconSize: 20,
          ),
        )
      ],
    ) :
    Row(
      children: [
        SizedBox(height: 20, width: 100,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'new',
              counterText: ''
            ),
            style: TextStyle(
              color: Colors.white,
            ),
            onChanged: (inputText) {
              newUsername = inputText;
            },
            maxLength: 10,
          ),
        ),
        Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: IconButton(
            onPressed: (){
              changeState(newUsername);
            },
            icon: Image(image: AssetImage('./lib/assets/icons/check.png')),
            iconSize: 20,
          ),
        )
      ],
    );
  }
}

