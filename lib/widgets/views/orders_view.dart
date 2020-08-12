import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jmorder_app/bloc/auth/orders/orders_bloc.dart';
import 'package:jmorder_app/bloc/auth/orders/orders_event.dart';
import 'package:jmorder_app/bloc/auth/orders/orders_state.dart';
import 'package:jmorder_app/models/order.dart';

class OrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrdersBloc>(context).add(OrdersViewLoaded());
    return Container(
      child: Stack(
        children: <Widget>[
          BlocBuilder<OrdersBloc, OrdersState>(
            builder: (context, state) {
              if (state is OrdersLoadedState) {
                return ListView(
                  children: state.orders.map((Order order) {
                    return ListTile(
                      onTap: () {
                        print("Pressed: ${order.createdAt}");
                      },
                      onLongPress: () {
                        print("Pressed: ${order.user.fullName}");
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                      ),
                      title: Text(
                          DateFormat.yMMMMd().add_jm().format(order.createdAt)),
                      subtitle: Text(
                          "발주자: ${order.user.fullName} / 거래처: ${order.client.name}"),
                    );
                  }).toList(),
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
