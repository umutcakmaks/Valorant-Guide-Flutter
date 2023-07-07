class Agent {
  final String uuid;
  final String displayName;
  final String description;
  final String developerName;
  final List<String>? characterTags;
  final String displayIcon;
  final String displayIconSmall;
  final String bustPortrait;
  final String fullPortrait;
  final String fullPortraitV2;
  final String killfeedPortrait;
  final String background;
  final List<String>? backgroundGradientColors;
  final String assetPath;
  final bool isFullPortraitRightFacing;
  final bool isPlayableCharacter;
  final bool isAvailableForTest;
  final bool isBaseContent;
  final Role role;
  final List<Ability> abilities;
  final VoiceLine voiceLine;

  Agent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    this.characterTags,
    required this.displayIcon,
    required this.displayIconSmall,
    required this.bustPortrait,
    required this.fullPortrait,
    required this.fullPortraitV2,
    required this.killfeedPortrait,
    required this.background,
    this.backgroundGradientColors,
    required this.assetPath,
    required this.isFullPortraitRightFacing,
    required this.isPlayableCharacter,
    required this.isAvailableForTest,
    required this.isBaseContent,
    required this.role,
    required this.abilities,
    required this.voiceLine,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      uuid: json['uuid'] ?? '',
      displayName: json['displayName'] ?? '',
      description: json['description'] ?? '',
      developerName: json['developerName'] ?? '',
      characterTags: json['characterTags'] != null ? List<String>.from(json['characterTags']) : null,
      displayIcon: json['displayIcon'] ?? '',
      displayIconSmall: json['displayIconSmall'] ?? '',
      bustPortrait: json['bustPortrait'] ?? '',
      fullPortrait: json['fullPortrait'] ?? '',
      fullPortraitV2: json['fullPortraitV2'] ?? '',
      killfeedPortrait: json['killfeedPortrait'] ?? '',
      background: json['background'] ?? '',
      backgroundGradientColors: json['backgroundGradientColors'] != null
          ? List<String>.from(json['backgroundGradientColors'])
          : null,
      assetPath: json['assetPath'] ?? '',
      isFullPortraitRightFacing: json['isFullPortraitRightFacing'] ?? false,
      isPlayableCharacter: json['isPlayableCharacter'] ?? false,
      isAvailableForTest: json['isAvailableForTest'] ?? false,
      isBaseContent: json['isBaseContent'] ?? false,
      role: Role.fromJson(json['role'] ?? {}),
      abilities: json['abilities'] != null
          ? List<Ability>.from(json['abilities'].map((ability) => Ability.fromJson(ability)))
          : [],
      voiceLine: VoiceLine.fromJson(json['voiceLine'] ?? {}),
    );
  }
}

class Role {
  final String uuid;
  final String displayName;
  final String description;
  final String displayIcon;
  final String assetPath;

  Role({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.assetPath,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      uuid: json['uuid'] ?? '',
      displayName: json['displayName'] ?? '',
      description: json['description'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
      assetPath: json['assetPath'] ?? '',
    );
  }
}

class Ability {
  final String slot;
  final String displayName;
  final String description;
  final String displayIcon;

  Ability({
    required this.slot,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      slot: json['slot'] ?? '',
      displayName: json['displayName'] ?? '',
      description: json['description'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
    );
  }
}

class VoiceLine {
  final double minDuration;
  final double maxDuration;
  final List<Media> mediaList;

  VoiceLine({
    required this.minDuration,
    required this.maxDuration,
    required this.mediaList,
  });

  factory VoiceLine.fromJson(Map<String, dynamic> json) {
    return VoiceLine(
      minDuration: json['minDuration'] ?? 0.0,
      maxDuration: json['maxDuration'] ?? 0.0,
      mediaList: json['mediaList'] != null
          ? List<Media>.from(json['mediaList'].map((media) => Media.fromJson(media)))
          : [],
    );
  }
}

class Media {
  final int id;
  final String wwise;
  final String wave;

  Media({
    required this.id,
    required this.wwise,
    required this.wave,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['id'] ?? 0,
      wwise: json['wwise'] ?? '',
      wave: json['wave'] ?? '',
    );
  }
}
