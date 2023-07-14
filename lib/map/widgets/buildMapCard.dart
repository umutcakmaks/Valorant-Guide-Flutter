import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorantguide/map/bloc/map.dart';
import 'package:valorantguide/models/map.dart';

class BuildMapCard extends StatelessWidget {
  final Maps map;
  final List<Maps> mapList;
  const BuildMapCard({super.key, required this.map, required this.mapList});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(builder: (context, state) {
      return Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          highlightColor: const Color(0x88ff4655),
          splashColor: const Color(0xFF65162A),
          onTap: () {
            BlocProvider.of<MapBloc>(context).add(SelectedMap(map, mapList));
            Navigator.pushNamed(context, '/mapdetail');
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  map.listViewIcon,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  map.displayName == "POLİGON" ? "POLIGON" : map.displayName,
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
            ],
          ),
        ),
      );
    });
  }
}
