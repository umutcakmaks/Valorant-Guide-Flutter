import 'package:flutter/material.dart';

class AgentPage extends StatefulWidget {
  const AgentPage({super.key});

  @override
  State<AgentPage> createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.topCenter,
                child: Text("AGENTS", style: TextStyle(color: Colors.white, fontSize: 26, fontFamily: 'valorant'),)
            ),
          ),
        ],
      ),
    );
  }
}
