import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jmorder_app/models/order.dart';
import 'package:jmorder_app/services/api_service.dart';

import 'exceptions/common_http_exception.dart';

class OrdersService {
  ApiService get _apiService => GetIt.I.get<ApiService>();
  List<Order> orders = [];

  Future<List<Order>> fetchOrders() async {
    try {
      var response = await _apiService.getClient().get('/orders');
      this.orders = List.from(List<Map>.from(response.data)
          .map((Map model) => Order.fromJson(model)));
      return this.orders;
    } on DioError catch (e) {
      if (e.response != null) throw FetchFailedException();
      throw UnexpectedOrdersException();
    }
  }

  Future<List<Order>> createOrder(Order order) async {
    try {
      var response = await _apiService.getClient().post('/orders', data: order.toJson());
      this.orders.insert(0, Order.fromJson(response.data));
      return this.orders;
    } on DioError {
      throw UnexpectedOrdersException();
    }
  }

  Future<void> deleteOrder(Order order) async {
    try {
      await _apiService.getClient().delete("/orders/${order.id}");
    } on DioError catch (e) {
      if (e.response != null) throw FetchFailedException();
      throw UnexpectedOrdersException();
    }
  }
}

class UnexpectedOrdersException extends DioError {}
