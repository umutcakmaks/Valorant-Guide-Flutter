import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Image(image: AssetImage("assets/valorantguide.png"), width: 131, height: 35,),),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Valorant Guide',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const GNav(
          tabs: [
            GButton(icon: Icons.group),
            GButton(icon: Icons.backpack),
            GButton(icon: Icons.map),

          ]
      ),
    );
  }
}
