import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:valorantguide/models/agent.dart';

class AgentRepository {
  static const baseUrl = "https://valorant-api.com/v1/agents?isPlayableCharacter=true&language=tr-TR";

  Future<List<Agent>> getAgent() async {
    final response = await http
        .get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['data'];
      final List<Agent> agentList =
      data.map((agentData) => Agent.fromJson(agentData)).toList();
      return agentList;
    }else{
      throw Exception('Failed to load Agent');
    }
  }

}