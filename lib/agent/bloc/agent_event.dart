part of 'agent_bloc.dart';

abstract class AgentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAgentData extends AgentEvent {
  GetAgentData();
}

class SelectedAgent extends AgentEvent {
  final Agent agent;
  final List<Agent> agentList;
  SelectedAgent(this.agent, this.agentList);
}