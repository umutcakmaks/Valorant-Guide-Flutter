import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:valorantguide/agent/AgentNavigator.dart';
import 'package:valorantguide/agent/bloc/agent.dart';
import 'package:valorantguide/collection/CollectionPage.dart';
import 'package:valorantguide/gamemode/GameModePage.dart';
import 'package:valorantguide/map/MapNavigator.dart';
import 'package:valorantguide/map/bloc/map.dart';
import 'package:valorantguide/repository/agent_repository.dart';
import 'package:valorantguide/repository/map_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AgentBloc>(create: (context) => AgentBloc(agentRepository: AgentRepository())..add(GetAgentData())),
        BlocProvider<MapBloc>(create: (context) => MapBloc(mapRepository: MapRepository())..add(GetMapData())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Color(0xFF65162A),
          ),
          scaffoldBackgroundColor: const Color(0xFFff4655),
          cardTheme: CardTheme(
            color: const Color(0xFFAB323D),
            elevation: 0,
            shape:  RoundedRectangleBorder(
              side: const BorderSide(
                color: Color(0xFF65162A),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10.0),
            )
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetPage = [
    AgentNavigator(),
    CollectionPage(),
    MapNavigator(),
    GameModePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: _widgetPage,
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFF65162A),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0,),
          child: GNav(
              gap: 8,
              backgroundColor: const Color(0xFF65162A),
              color: const Color(0xE0FFFFFF),
              activeColor: const Color(0xE0FFFFFF),
              tabBackgroundColor: const Color(0xD27E102C),
              padding: const EdgeInsets.all(8),
              selectedIndex: _selectedIndex,
              onTabChange: (index){
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: const [
                GButton(
                    icon: Icons.group,
                    text: "Agents",
                ),
                GButton(
                    icon: Icons.backpack,
                    text: "Collection",
                ),
                GButton(
                    icon: Icons.map,
                    text: "Maps",
                ),
                GButton(
                  icon: Icons.gamepad,
                  text: "Game Modes",
                ),

              ]
          ),
        ),
      ),
    );
  }
}
