import 'package:equatable/equatable.dart';
import 'package:jmorder_app/models/client.dart';
import 'package:meta/meta.dart';

abstract class ClientsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ClientsLoadingState extends ClientsState {}

class ClientsLoadedState extends ClientsState {
  final List<Client> clients;

  ClientsLoadedState({@required this.clients});
  @override
  List<Object> get props => [clients];
}

class ClientAddedState extends ClientsState {
  final Client client;

  ClientAddedState({@required this.client});
}
