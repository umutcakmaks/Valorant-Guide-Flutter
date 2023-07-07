import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorantguide/models/agent.dart';
import 'package:valorantguide/repository/agent_repository.dart';

part 'agent_event.dart';
part 'agent_state.dart';

class AgentBloc extends Bloc<AgentEvent, AgentState> {
  final AgentRepository agentRepository;

  AgentBloc({required this.agentRepository}) : super(InitialState()){
    on<GetAgentData>((event, emit) async {
      try{
        final data = await agentRepository.getAgent();
        emit(AgentLoaded(data));
      }catch (e) {
        print(e.toString());
        emit(AgentError(e.toString()));
      }
    });
    on<SelectedAgent>((event, emit) async {
      try{
        emit(AgentSelected(event.agent, event.agentList));
      }catch (e) {
        emit(AgentError(e.toString()));
      }
    });
  }
}