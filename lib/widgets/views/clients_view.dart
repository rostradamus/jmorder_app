import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jmorder_app/bloc/clients/clients_bloc.dart';
import 'package:jmorder_app/bloc/clients/clients_event.dart';
import 'package:jmorder_app/bloc/clients/clients_state.dart';
import 'package:jmorder_app/models/client.dart';

class ClientsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ClientsBloc>(context).add(ClientsViewLoaded());
    return Container(
      child: Stack(
        children: <Widget>[
          BlocBuilder<ClientsBloc, ClientsState>(
            builder: (context, state) {
              if (state is ClientsLoadedState) {
                return ListView(
                  children: state.clients
                      .map(
                        (Client client) => ListTile(
                          onTap: () {
                            print("Pressed: ${client.name}");
                          },
                          onLongPress: () {
                            print("Pressed: ${client.phone}");
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.green,
                          ),
                          title: Text(client.name),
                          subtitle: Text(client.phone),
                        ),
                      )
                      .toList(),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
