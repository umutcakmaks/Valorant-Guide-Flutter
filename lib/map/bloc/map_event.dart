part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetMapData extends MapEvent {
  GetMapData();
}

class SelectedMap extends MapEvent {
  final Maps map;
  final List<Maps> mapList;
  SelectedMap(this.map, this.mapList);
}