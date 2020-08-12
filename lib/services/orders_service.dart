import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jmorder_app/models/order.dart';
import 'package:jmorder_app/services/api_service.dart';

import 'exceptions/common_http_exception.dart';

class OrdersService {
  ApiService get _apiService => GetIt.I.get<ApiService>();

  Future<List<Order>> fetchOrders() async {
    try {
      var response = await _apiService.getClient().get('/orders');
      return List.from(List<Map>.from(response.data)
          .map((Map model) => Order.fromJson(model)));
    } on DioError catch (e) {
      if (e.response != null) throw FetchFailedException();
      throw UnexpectedOrdersException();
    }
  }
}

class UnexpectedOrdersException extends DioError {}
