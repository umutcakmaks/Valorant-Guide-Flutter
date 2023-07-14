import 'package:flutter/material.dart';
import 'package:valorantguide/map/MapDetailPage.dart';
import 'package:valorantguide/map/MapPage.dart';

class MapNavigator extends StatefulWidget {
  const MapNavigator({super.key});

  @override
  State<MapNavigator> createState() => _MapNavigatorState();
}

class _MapNavigatorState extends State<MapNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context){
              switch (settings.name){
                case'/':
                  return const MapPage();
                case'/mapdetail':
                  return const MapDetailPage();
                default:
                  return const MapPage();
              }
            }
        );
      },
    );
  }
}
