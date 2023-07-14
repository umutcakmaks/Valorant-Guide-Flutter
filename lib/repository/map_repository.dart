import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:valorantguide/models/map.dart';

class MapRepository {
  static const baseUrl = "https://valorant-api.com/v1/maps?language=tr-TR";

  Future<List<Maps>> getMaps() async {
    final response = await http
        .get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['data'];
      final List<Maps> mapList =
      data.map((mapData) => Maps.fromJson(mapData)).toList();
      return mapList;
    }else{
      throw Exception('Failed to load Map');
    }
  }

}