part of 'map_bloc.dart';

@immutable
abstract class MapState extends Equatable {

}

class InitialState extends MapState {
  InitialState();
  @override
  List<Object?> get props => [];
}

class MapError extends MapState {
  final String error;

  MapError(this.error);
  @override
  List<Object?> get props => [error];
}

class MapLoaded extends MapState {
  final List<Maps> map;
  MapLoaded(this.map);
  @override
  List<Object?> get props => [map];
}

class MapSelected extends MapState {
  final Maps map;
  final List<Maps> mapList;
  MapSelected(this.map, this.mapList);
  @override
  List<Object?> get props => [map, mapList];
}