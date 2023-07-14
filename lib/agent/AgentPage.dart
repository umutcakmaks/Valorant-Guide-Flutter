import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorantguide/agent/bloc/agent.dart';
import 'package:valorantguide/agent/widgets/buildAgentCard.dart';
import 'package:valorantguide/models/agent.dart';

class AgentPage extends StatefulWidget {
  const AgentPage({super.key});

  @override
  State<AgentPage> createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentBloc, AgentState>(
      builder: (context, state) {
        if (state is AgentLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Image(
                  image: AssetImage("assets/images/valorantguide.png"),
                  width: 131,
                  height: 35,
                ),
              ),
              centerTitle: true,
              elevation: 1,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        bottom: 2, top: 10, right: 10, left: 10),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "AGENTS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontFamily: 'valorant',
                            fontWeight: FontWeight.w800,
                            shadows: [
                              Shadow(
                                offset: Offset(3.0, 3.0),
                                blurRadius: 5.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                          ),
                        )),
                  ),
                  ListView.builder(
                    physics: const ScrollPhysics(parent: null),
                    shrinkWrap: true,
                    itemCount: (state.agent.length / 2).ceil(),
                    itemBuilder: (context, index) {
                      int startIndex = index * 2;
                      int endIndex = startIndex + 1;
                      List<Agent> agents = [];

                      if (startIndex < state.agent.length) {
                        agents.add(state.agent[startIndex]);
                      }

                      if (endIndex < state.agent.length) {
                        agents.add(state.agent[endIndex]);
                      }

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: agents.map((agent) {
                            return Expanded(
                                child: BuildAgentCard(
                              agent: agent,
                              agentList: state.agent,
                            ));
                          }).toList(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        } else if (state is AgentSelected) {
          return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Image(
                  image: AssetImage("assets/images/valorantguide.png"),
                  width: 131,
                  height: 35,
                ),
              ),
              centerTitle: true,
              elevation: 1,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        bottom: 2, top: 10, right: 10, left: 10),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "AGENTS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontFamily: 'valorant',
                            fontWeight: FontWeight.w800,
                            shadows: [
                              Shadow(
                                offset: Offset(3.0, 3.0),
                                blurRadius: 5.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                          ),
                        )),
                  ),
                  ListView.builder(
                    physics: const ScrollPhysics(parent: null),
                    shrinkWrap: true,
                    itemCount: (state.agentList.length / 2).ceil(),
                    itemBuilder: (context, index) {
                      int startIndex = index * 2;
                      int endIndex = startIndex + 1;
                      List<Agent> agents = [];

                      if (startIndex < state.agentList.length) {
                        agents.add(state.agentList[startIndex]);
                      }

                      if (endIndex < state.agentList.length) {
                        agents.add(state.agentList[endIndex]);
                      }

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: agents.map((agent) {
                            return Expanded(
                                child: BuildAgentCard(
                              agent: agent,
                              agentList: state.agentList,
                            ));
                          }).toList(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Image(
                  image: AssetImage("assets/images/valorantguide.png"),
                  width: 131,
                  height: 35,
                ),
              ),
              centerTitle: true,
              elevation: 1,
            ),
            body: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "AGENTS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'valorant',
                          fontWeight: FontWeight.w800,
                          shadows: [
                            Shadow(
                              offset: Offset(3.0, 3.0),
                              blurRadius: 5.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                      )),
                ),
                Flexible(
                    flex: 1,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ))
              ],
            ),
          );
        }
      },
    );
  }
}
