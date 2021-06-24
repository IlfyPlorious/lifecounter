import 'package:flutter/material.dart';

class TwoPlayers extends StatefulWidget {
  const TwoPlayers({Key? key}) : super(key: key);

  @override
  _TwoPlayersState createState() => _TwoPlayersState();
}

class _TwoPlayersState extends State<TwoPlayers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: RotatedBox(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Expanded(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: (){},
                                      icon: Icon( Icons.reset_tv_rounded )
                                  ),
                                  IconButton(
                                      onPressed: (){},
                                      icon: Icon( Icons.cabin )
                                  ),
                                ],
                              ), flex: 1,),
                              Expanded(child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: IconButton(onPressed: () {},
                                        icon: Icon( Icons.arrow_downward )
                                    ),
                                  ),
                                  Center(child: Text("hp")),
                                  Expanded(
                                    child: IconButton(onPressed: (){},
                                        icon: Icon( Icons.arrow_upward )
                                    ),
                                  )
                                ],
                              ), flex: 3,),
                              Expanded(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: (){},
                                      icon: Icon( Icons.reset_tv_rounded )
                                  ),
                                  IconButton(
                                      onPressed: (){},
                                      icon: Icon( Icons.cabin )
                                  ),
                                ],
                              ), flex: 1,)
                            ],
                          ),
                        ),
                        color: Colors.green
                      ),
                      quarterTurns: 2,
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: (){},
                                    icon: Icon( Icons.reset_tv_rounded )
                                ),
                                IconButton(
                                    onPressed: (){},
                                    icon: Icon( Icons.cabin )
                                ),
                              ],
                            ), flex: 1,),
                            Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: IconButton(onPressed: () {},
                                      icon: Icon( Icons.arrow_downward )
                                  ),
                                ),
                                Center(child: Text("hp")),
                                Expanded(
                                  child: IconButton(onPressed: (){},
                                      icon: Icon( Icons.arrow_upward )
                                  ),
                                )
                              ],
                            ), flex: 3,),
                            Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: (){},
                                    icon: Icon( Icons.reset_tv_rounded )
                                ),
                                IconButton(
                                    onPressed: (){},
                                    icon: Icon( Icons.cabin )
                                ),
                              ],
                            ), flex: 1,)
                          ],
                        ),
                      ),
                      color: Colors.green,
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
