import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorantguide/agent/bloc/agent.dart';

class AgentAbilities extends StatefulWidget {
  const AgentAbilities({super.key});

  @override
  State<AgentAbilities> createState() => _AgentAbilitiesState();
}

class _AgentAbilitiesState extends State<AgentAbilities> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFff4655),
      child: BlocBuilder<AgentBloc, AgentState>(builder: (context, state) {
        if (state is AgentSelected) {
          return SingleChildScrollView(
            child: Column(
              children: state.agent.abilities.map((ability) {
                return Center(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            ability.displayIcon,
                            width: 50,
                            height: 50,
                            opacity: const AlwaysStoppedAnimation(.75),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              ability.displayName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 12.0),
                        child: Text(
                          ability.description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
