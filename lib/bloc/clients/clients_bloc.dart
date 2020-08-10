import 'package:jmorder_app/bloc/clients/clients_event.dart';
import 'package:jmorder_app/bloc/clients/clients_state.dart';
import 'package:jmorder_app/models/client.dart';
import 'package:jmorder_app/services/clients_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ClientsBloc extends Bloc<ClientsEvent, ClientsState> {
  ClientsService _clientsService = GetIt.I.get<ClientsService>();

  ClientsBloc(ClientsState initialState) : super(initialState);

  @override
  Stream<ClientsState> mapEventToState(ClientsEvent event) async* {
    if (event is ClientsViewLoaded) {
      this.add(ClientsListRefreshed());
    }
    if (event is ClientsListRefreshed) {
      yield ClientsLoadingState();
      List<Client> clients = await _clientsService.fetchClients();
      yield ClientsLoadedState(clients: clients);
    }
  }
}
