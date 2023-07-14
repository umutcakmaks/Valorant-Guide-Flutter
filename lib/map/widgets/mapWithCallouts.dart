import 'package:flutter/material.dart';
import 'package:valorantguide/models/map.dart';

class MapWithCallouts extends StatefulWidget {
  final Maps map;

  const MapWithCallouts({required this.map});

  @override
  State<MapWithCallouts> createState() => _MapWithCalloutsState();
}

class _MapWithCalloutsState extends State<MapWithCallouts> {
  Map<String, bool> isHoveredMap = {};

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          widget.map.displayIcon,
          height: 375,
          width: 375,
        ),
        for (final callout in widget.map.callouts)
          widget.map.xMultiplier != 0
              ? Positioned(
                  left: (callout.location.y * widget.map.xMultiplier +
                          widget.map.xScalarToAdd) *
                      375,
                  top: (callout.location.x * widget.map.yMultiplier +
                          widget.map.yScalarToAdd) *
                      375,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isHoveredMap[callout.superRegionName +
                            callout.regionName] = !isHoveredMap.containsKey(
                                callout.superRegionName + callout.regionName)
                            ? true
                            : !isHoveredMap[
                                callout.superRegionName + callout.regionName]!;
                      });
                    },
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isHoveredMap.containsKey(
                                    callout.superRegionName +
                                        callout.regionName) &&
                                isHoveredMap[callout.superRegionName +
                                    callout.regionName]!
                            ? const Color(0xFFff4655)
                            : const Color(0xFF65162A),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        for (final callout in widget.map.callouts)
          widget.map.xMultiplier != 0
              ? Positioned(
                  left: (callout.location.y * widget.map.xMultiplier +
                          widget.map.xScalarToAdd) *
                      350,
                  top: (callout.location.x * widget.map.yMultiplier +
                          widget.map.yScalarToAdd) *
                      390,
                  child: isHoveredMap.containsKey(
                              callout.superRegionName + callout.regionName) &&
                          isHoveredMap[
                              callout.superRegionName + callout.regionName]!
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              isHoveredMap[callout.superRegionName +
                                  callout.regionName] = false;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.5),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.30),
                                  Colors.black.withOpacity(0.20),
                                  Colors.black.withOpacity(0.10),
                                  Colors.black.withOpacity(0.10),
                                  Colors.black.withOpacity(0.20),
                                  Colors.black.withOpacity(0.30),
                                ],
                                stops: const [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
                              ),
                            ),
                            child: Text(
                              "${callout.superRegionName} ${callout.regionName}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.7),
                                    offset: Offset(0, 2),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const Text(""),
                )
              : const SizedBox(),
      ],
    );
  }
}
