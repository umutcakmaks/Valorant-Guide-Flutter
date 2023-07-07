part of 'agent_bloc.dart';

@immutable
abstract class AgentState extends Equatable {

}

class InitialState extends AgentState {
  InitialState();
  @override
  List<Object?> get props => [];
}

class AgentError extends AgentState {
  final String error;

  AgentError(this.error);
  @override
  List<Object?> get props => [error];
}

class AgentLoaded extends AgentState {
  final List<Agent> agent;
  AgentLoaded(this.agent);
  @override
  List<Object?> get props => [agent];
}

class AgentSelected extends AgentState {
  final Agent agent;
  final List<Agent> agentList;
  AgentSelected(this.agent, this.agentList);
  @override
  List<Object?> get props => [agent, agentList];
}