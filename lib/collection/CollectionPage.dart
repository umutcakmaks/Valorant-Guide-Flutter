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
      appBar: AppBar(
        title: const Center(child: Image(image: AssetImage("assets/images/valorantguide.png"), width: 131, height: 35,),),
        centerTitle: true,
        elevation: 1,
      ),
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
