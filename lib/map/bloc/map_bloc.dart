import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorantguide/models/map.dart';
import 'package:valorantguide/repository/map_repository.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository mapRepository;

  MapBloc({required this.mapRepository}) : super(InitialState()){
    on<GetMapData>((event, emit) async {
      try{
        final data = await mapRepository.getMaps();
        emit(MapLoaded(data));
      }catch (e) {
        print(e.toString());
        emit(MapError(e.toString()));
      }
    });
    on<SelectedMap>((event, emit) async {
      try{
        emit(MapSelected(event.map, event.mapList));
      }catch (e) {
        emit(MapError(e.toString()));
      }
    });
  }
}