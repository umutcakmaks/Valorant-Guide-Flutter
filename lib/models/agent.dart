class Agent {
  final String uuid;
  final String displayName;
  final String description;
  final String developerName;
  final List<String> characterTags;
  final String displayIcon;
  final String displayIconSmall;
  final String bustPortrait;
  final String fullPortrait;
  final String fullPortraitV2;
  final String killfeedPortrait;
  final String background;
  final List<String> backgroundGradientColors;
  final String assetPath;
  final bool isFullPortraitRightFacing;
  final bool isPlayableCharacter;
  final bool isAvailableForTest;
  final bool isBaseContent;
  final AgentRole? role;
  final List<AgentAbility> abilities;
  final Object voiceLine;

  Agent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    required this.characterTags,
    required this.displayIcon,
    required this.displayIconSmall,
    required this.bustPortrait,
    required this.fullPortrait,
    required this.fullPortraitV2,
    required this.killfeedPortrait,
    required this.background,
    required this.backgroundGradientColors,
    required this.assetPath,
    required this.isFullPortraitRightFacing,
    required this.isPlayableCharacter,
    required this.isAvailableForTest,
    required this.isBaseContent,
    this.role,
    required this.abilities,
    required this.voiceLine
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
        uuid: json['uuid'],
        displayName: json['displayName'],
        description: json['description'],
        developerName: json['developerName'],
        characterTags: json['characterTags'],
        displayIcon: json['displayIcon'],
        displayIconSmall: json['displayIconSmall'],
        bustPortrait: json['bustPortrait'],
        fullPortrait: json['fullPortrait'],
        fullPortraitV2: json['fullPortraitV2'],
        killfeedPortrait: json['killfeedPortrait'],
        background: json['background'],
        backgroundGradientColors: json['backgroundGradientColors'],
        assetPath: json['assetPath'],
        isFullPortraitRightFacing: json['isFullPortraitRightFacing'],
        isPlayableCharacter: json['isPlayableCharacter'],
        isAvailableForTest: json['isAvailableForTest'],
        abilities: json['abilities'],
        isBaseContent: json['isBaseContent'],
        role: json['role'],
        voiceLine: json['voiceLine']
    );
  }
}

class AgentAbility{
  final String slot;
  final String? displayName;
  final String? description;
  final String? displayIcon;

  AgentAbility({
    required this.slot,
    this.displayName,
    this.description,
    this.displayIcon
  });
}

class AgentRole {
  final String uuid;
  final String displayName;
  final String description;
  final String displayIcon;
  final String assetPath;

  AgentRole({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.assetPath
  });
}