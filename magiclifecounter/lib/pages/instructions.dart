import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {
  const Instructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructions'),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Card(
              child: Padding(padding: const EdgeInsets.all(12), child: Text(
                'While in life counter you can swipe right to go back',
                style: TextStyle(
                  fontSize: 20
                ),
              ),),
            ),
            Card(
              child: Padding(padding: const EdgeInsets.all(12), child: Text(
                'Your life, commander damage ( for 2 players only ), and poison damage is saved locally',
                style: TextStyle(
                    fontSize: 20
                ),
              ),),
            ),
            Card(
              child: Padding(padding: const EdgeInsets.all(12), child: Text(
                'You can edit your player name in the stats menu',
                style: TextStyle(
                    fontSize: 20
                ),
              ),),
            ),
            Card(
              child: Padding(padding: const EdgeInsets.all(12), child: Text(
                'Tap player name to reset commander damage in 4 players mode',
                style: TextStyle(
                  fontSize: 20
                ),
              ),),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade900,
    );
  }
}
