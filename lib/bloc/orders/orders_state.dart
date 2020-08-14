import 'package:equatable/equatable.dart';
import 'package:jmorder_app/models/order.dart';
import 'package:meta/meta.dart';

abstract class OrdersState extends Equatable {
  @override
  List<Object> get props => [];
}

class OrdersLoadingState extends OrdersState {}

class OrdersLoadedState extends OrdersState {
  final List<Order> orders;

  OrdersLoadedState({@required this.orders});
  @override
  List<Object> get props => [orders];
}
