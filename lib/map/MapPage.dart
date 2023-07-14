import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorantguide/map/bloc/map.dart';
import 'package:valorantguide/map/widgets/buildMapCard.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(builder: (context, state) {
      if (state is MapLoaded) {
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
                  padding:
                      EdgeInsets.only(bottom: 2, top: 10, right: 10, left: 10),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "MAPS",
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
                  itemCount: state.map.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BuildMapCard(
                        map: state.map[index],
                        mapList: state.map,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      } else if (state is MapSelected) {
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
                  padding:
                      EdgeInsets.only(bottom: 2, top: 10, right: 10, left: 10),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "MAPS",
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
                  itemCount: state.mapList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BuildMapCard(
                        map: state.mapList[index],
                        mapList: state.mapList,
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
          body: SingleChildScrollView(
            child: Column(
              children: const [
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 2, top: 10, right: 10, left: 10),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "MAPS",
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
              ],
            ),
          ),
        );
      }
    });
  }
}
