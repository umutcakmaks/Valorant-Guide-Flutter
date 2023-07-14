class Maps {
  final String uuid;
  final String displayName;
  final String coordinates;
  final String displayIcon;
  final String listViewIcon;
  final String splash;
  final String assetPath;
  final String mapUrl;
  final double xMultiplier;
  final double yMultiplier;
  final double xScalarToAdd;
  final double yScalarToAdd;
  final List<Callout> callouts;

  Maps({
    required this.uuid,
    required this.displayName,
    required this.coordinates,
    required this.displayIcon,
    required this.listViewIcon,
    required this.splash,
    required this.assetPath,
    required this.mapUrl,
    required this.xMultiplier,
    required this.yMultiplier,
    required this.xScalarToAdd,
    required this.yScalarToAdd,
    required this.callouts,
  });

  factory Maps.fromJson(Map<String, dynamic> json) {
    final List<Callout> callouts = (json['callouts'] as List<dynamic>?)
        ?.map((x) => Callout.fromJson(x))
        .toList() ?? [];

    return Maps(
      uuid: json['uuid'] ?? '',
      displayName: json['displayName'] ?? '',
      coordinates: json['coordinates'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
      listViewIcon: json['listViewIcon'] ?? '',
      splash: json['splash'] ?? '',
      assetPath: json['assetPath'] ?? '',
      mapUrl: json['mapUrl'] ?? '',
      xMultiplier: json['xMultiplier']?.toDouble() ?? 0.0,
      yMultiplier: json['yMultiplier']?.toDouble() ?? 0.0,
      xScalarToAdd: json['xScalarToAdd']?.toDouble() ?? 0.0,
      yScalarToAdd: json['yScalarToAdd']?.toDouble() ?? 0.0,
      callouts: callouts,
    );
  }
}

class Callout {
  final String regionName;
  final String superRegionName;
  final Location location;

  Callout({
    required this.regionName,
    required this.superRegionName,
    required this.location,
  });

  factory Callout.fromJson(Map<String, dynamic> json) {
    return Callout(
      regionName: json['regionName'] ?? '',
      superRegionName: json['superRegionName'] ?? '',
      location: Location.fromJson(json['location'] ?? {}),
    );
  }
}

class Location {
  final double x;
  final double y;

  Location({
    required this.x,
    required this.y,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      x: json['x'].toDouble() ?? 0.0,
      y: json['y'].toDouble() ?? 0.0,
    );
  }
}