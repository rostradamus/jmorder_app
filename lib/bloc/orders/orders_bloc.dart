import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jmorder_app/bloc/orders/orders_event.dart';
import 'package:jmorder_app/bloc/orders/orders_state.dart';
import 'package:jmorder_app/models/order.dart';
import 'package:jmorder_app/services/orders_service.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersService _ordersService = GetIt.I.get<OrdersService>();

  OrdersBloc(OrdersState initialState) : super(initialState);

  @override
  Stream<OrdersState> mapEventToState(OrdersEvent event) async* {
    if (event is OrdersViewLoaded) {
      this.add(OrdersListRefreshed());
    }
    if (event is OrdersListRefreshed) {
      yield OrdersLoadingState();
      List<Order> orders = await _ordersService.fetchOrders();
      yield OrdersLoadedState(orders: orders);
    }
  }
}
