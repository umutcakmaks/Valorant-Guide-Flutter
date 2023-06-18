import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:valorantguide/agent/AgentPage.dart';
import 'package:valorantguide/collection/CollectionPage.dart';
import 'package:valorantguide/gamemode/GameModePage.dart';
import 'package:valorantguide/map/MapPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    AgentPage(),
    CollectionPage(),
    MapPage(),
    GameModePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Image(image: AssetImage("assets/images/valorantguide.png"), width: 131, height: 35,),),
        centerTitle: true,
        elevation: 1,
      ),
      body: _widgetPage.elementAt(_selectedIndex),
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
