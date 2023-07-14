import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorantguide/map/bloc/map.dart';
import 'package:valorantguide/map/widgets/mapWithCallouts.dart';

class MapDetailPage extends StatefulWidget {
  const MapDetailPage({super.key});

  @override
  State<MapDetailPage> createState() => _MapDetailPageState();
}

class _MapDetailPageState extends State<MapDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(builder: (context, state) {
      if (state is MapSelected) {
        final List<String> cordinatesComma = state.map.coordinates.split(',');
        final List<String> cordinatesSpace = state.map.coordinates.split(' ');
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                state.map.displayName,
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.network(
                        state.map.splash,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 3.0, left: 15, right: 22),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.white.withOpacity(0.40),
                              Colors.white.withOpacity(0.35),
                              Colors.white.withOpacity(0.30),
                              Colors.white.withOpacity(0.25),
                              Colors.white.withOpacity(0.20),
                              Colors.white.withOpacity(0.15),
                              Colors.white.withOpacity(0.10),
                              Colors.white.withOpacity(0.05),
                              Colors.transparent
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              cordinatesSpace.isNotEmpty &&
                                      cordinatesSpace.length > 1
                                  ? Text(
                                      cordinatesSpace[0],
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  : cordinatesComma.isNotEmpty
                                      ? Text(
                                          cordinatesComma[0],
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      : const SizedBox(),
                              cordinatesSpace.length > 1
                                  ? Text(
                                      cordinatesSpace[1],
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  : cordinatesComma.length > 1
                                      ? Text(
                                          cordinatesComma[1],
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "CALLOUTS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MapWithCallouts(map: state.map),
                ),
              ],
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
