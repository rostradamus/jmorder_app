import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:get_it/get_it.dart';
import 'package:jmorder_app/models/client.dart';
import 'package:jmorder_app/services/api_service.dart';

import 'exceptions/common_http_exception.dart';

class ClientsService {
  ApiService get _apiService => GetIt.I.get<ApiService>();
  List<Client> _clients = [];

  Future<List<Client>> fetchClients() async {
    try {
      var response = await _apiService.getClient().get('/clients');
      this._clients = List.from(List<Map>.from(response.data)
          .map((Map model) => Client.fromJson(model)));
      return this._clients;
    } on DioError catch (e) {
      if (e.response != null) throw FetchFailedException();
      throw UnexpectedClientsException();
    }
  }

  Future<void> deleteClient(Client client) async {
    try {
      await _apiService.getClient().delete("/clients/${client.id}");
    } on DioError {
      throw UnexpectedClientsException();
    }
  }

  Future<List<Client>> createClient({
    @required name,
    @required phone,
    address,
  }) async {
    try {
      var response = await _apiService.getClient().post('/clients', data: {
        "name": name,
        "phone": phone,
      });
      this._clients.insert(0, Client.fromJson(response.data));
      return this._clients;
    } on DioError {
      throw UnexpectedClientsException();
    }
  }
}

class UnexpectedClientsException extends DioError {}
