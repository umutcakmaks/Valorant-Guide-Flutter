import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:valorantguide/agent/bloc/agent.dart';
import 'package:valorantguide/agent/widgets/agentAbilities.dart';

class AgentDetailPage extends StatefulWidget {
  const AgentDetailPage({
    super.key,
  });

  @override
  State<AgentDetailPage> createState() => _AgentDetailPageState();
}

class _AgentDetailPageState extends State<AgentDetailPage> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  bool isHovered = false;
  bool isHoveredDescription = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentBloc, AgentState>(builder: (context, state) {
      if (state is AgentSelected) {
        List<String> words = state.agent.role.displayName.split(' ');
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                state.agent.displayName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'valorant',
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
            centerTitle: true,
            elevation: 1,
            leading: IconButton(
              highlightColor: const Color(0x88ff4655),
              splashColor: const Color(0xFF65162A),
              splashRadius: 20,
              icon: const Icon(
                Icons.arrow_back,
                weight: 700,
                size: 28,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SliderDrawer(
            slideDirection: SlideDirection.RIGHT_TO_LEFT,
            appBar: null,
            key: _sliderDrawerKey,
            sliderOpenSize: MediaQuery.of(context).size.width * 0.60,
            slider: const AgentAbilities(),
            child: Container(
              color: const Color(0xFFff4655),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Image.network(
                          state.agent.background,
                          width: 500,
                          height: 500,
                          opacity: const AlwaysStoppedAnimation(.4),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 55.0),
                          child: Image.network(
                            state.agent.fullPortrait,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 12.0),
                                  child: GestureDetector(
                                    child: Image.network(
                                      state.agent.role.displayIcon,
                                      width: 40,
                                      height: 40,
                                      opacity:
                                          const AlwaysStoppedAnimation(.75),
                                    ),
                                    onLongPress: () {
                                      setState(() {
                                        isHoveredDescription =
                                            !isHoveredDescription;
                                      });
                                    },
                                    onTap: () {
                                      setState(() {
                                        isHovered = !isHovered;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 8.0),
                                  child: isHovered
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: words.map((word) {
                                            return Text(
                                              word,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            );
                                          }).toList(),
                                        )
                                      : const Text(""),
                                )
                              ],
                            ),
                            isHoveredDescription
                                ? SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.70,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, left: 8.0),
                                      child: Text(
                                        state.agent.role.description,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                : const Text(""),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, right: 12.0),
                            child: GestureDetector(
                              child: Image.network(
                                state.agent.abilities[0].slot == "Ability2"
                                    ? state.agent.abilities[0].displayIcon
                                    : state.agent.abilities[1].slot ==
                                            "Ability2"
                                        ? state.agent.abilities[1].displayIcon
                                        : state.agent.abilities[2].slot ==
                                                "Ability2"
                                            ? state
                                                .agent.abilities[2].displayIcon
                                            : state.agent.abilities[3].slot ==
                                                    "Ability2"
                                                ? state.agent.abilities[3]
                                                    .displayIcon
                                                : state.agent.abilities[1]
                                                    .displayIcon,
                                width: 40,
                                height: 40,
                                opacity: const AlwaysStoppedAnimation(.75),
                              ),
                              onTap: () {
                                if (_sliderDrawerKey
                                    .currentState!.isDrawerOpen) {
                                  _sliderDrawerKey.currentState!.closeSlider();
                                } else {
                                  _sliderDrawerKey.currentState!.openSlider();
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 18, right: 18),
                      child: Text(
                        state.agent.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: const Image(
              image: AssetImage("assets/images/valorantguide.png"),
              width: 131,
              height: 35,
            ),
            centerTitle: true,
            elevation: 1,
            leading: IconButton(
              highlightColor: const Color(0x88ff4655),
              splashColor: const Color(0xFF65162A),
              splashRadius: 20,
              icon: const Icon(
                Icons.arrow_back,
                weight: 700,
                size: 28,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: const Center(),
        );
      }
    });
  }
}
