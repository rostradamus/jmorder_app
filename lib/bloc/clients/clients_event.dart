import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ClientsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ClientsViewLoaded extends ClientsEvent {}

class ClientsListRefreshed extends ClientsEvent {}

class ClientsCreated extends ClientsEvent {
  final String name;
  final String phone;

  ClientsCreated({@required this.name, @required this.phone});
}
