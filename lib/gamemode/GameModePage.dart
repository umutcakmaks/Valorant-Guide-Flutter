import 'package:flutter/material.dart';

class GameModePage extends StatefulWidget {
  const GameModePage({super.key});

  @override
  State<GameModePage> createState() => _GameModePageState();
}

class _GameModePageState extends State<GameModePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Image(image: AssetImage("assets/images/valorantguide.png"), width: 131, height: 35,),),
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.topCenter,
                child: Text("GAME MODE", style: TextStyle(color: Colors.white, fontSize: 26, fontFamily: 'valorant'),)
            ),
          ),
        ],
      ),
    );
  }
}
