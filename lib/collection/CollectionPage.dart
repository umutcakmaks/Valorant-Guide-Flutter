import 'package:flutter/material.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.topCenter,
                child: Text("COLLECTION", style: TextStyle(color: Colors.white, fontSize: 26, fontFamily: 'valorant'),)
            ),
          ),
        ],
      ),
    );
  }
}
