import 'package:flutter/material.dart';
import 'package:valorantguide/agent/AgentDetailPage.dart';
import 'package:valorantguide/agent/AgentPage.dart';

class AgentNavigator extends StatefulWidget {
  const AgentNavigator({super.key});

  @override
  State<AgentNavigator> createState() => _AgentNavigatorState();
}

class _AgentNavigatorState extends State<AgentNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
            builder: (BuildContext context){
            switch (settings.name){
              case'/':
                return const AgentPage();
              case'/agentdetail':
                //final args = settings.arguments as Agent;
                return const AgentDetailPage();
              default:
                return const AgentPage();
            }
        }
        );
      },
    );
  }
}
