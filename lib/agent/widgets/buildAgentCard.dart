import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorantguide/agent/bloc/agent.dart';
import 'package:valorantguide/models/agent.dart';

class BuildAgentCard extends StatelessWidget {
  final Agent agent;
  final List<Agent> agentList;
  const BuildAgentCard(
      {super.key, required this.agent, required this.agentList});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentBloc, AgentState>(builder: (context, state) {
      return Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          highlightColor: const Color(0x88ff4655),
          splashColor: const Color(0xFF65162A),
          onTap: () {
            BlocProvider.of<AgentBloc>(context)
                .add(SelectedAgent(agent, agentList));
            Navigator.pushNamed(context, '/agentdetail');
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  agent.displayIcon,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  agent.displayName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'valorant',
                    fontSize: 24,
                    shadows: [
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 5.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              // Diğer bilgileri ekleyebilirsiniz
            ],
          ),
        ),
      );
    });
  }
}
