import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Center(child: Image(image: AssetImage('./lib/assets/icons/appiconmtg.png'), width: 300, height: 300,)),
              SizedBox(height: 60,),
              Row(
                children: [
                  Expanded(child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/two_players');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'game for two buddies',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.amber
                    ),
                  ))
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/four_players');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'party of four',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 20
                          ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                  ))
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/instructions');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'instructions',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 20
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                  ))
                ],
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
      backgroundColor: Colors.grey[800],
    );
  }


}
