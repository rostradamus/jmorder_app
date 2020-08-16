import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jmorder_app/models/client.dart';
import 'package:jmorder_app/models/item.dart';

abstract class ClientsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ClientsViewLoaded extends ClientsEvent {}

class ClientsListRefreshed extends ClientsEvent {}

class SubmitClientAdd extends ClientsEvent {
  final Client client;

  SubmitClientAdd({@required this.client});
}

class AddItemToClient extends ClientsEvent {
  final List<Item> clientItems;
  final Item addedItem;

  AddItemToClient({
    this.clientItems,
    this.addedItem,
  });
}
