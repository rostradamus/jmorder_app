import 'package:jmorder_app/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:jmorder_app/services/api_service.dart';
import 'package:jmorder_app/services/clients_service.dart';
import 'package:jmorder_app/services/orders_service.dart';

void setupLocator() {
  GetIt.I.registerSingletonAsync<ApiService>(() async {
    final apiService = ApiService();
    return apiService.init();
  });
  GetIt.I.registerSingleton<AuthService>(AuthService());
  GetIt.I.registerSingleton<ClientsService>(ClientsService());
  GetIt.I.registerSingleton<OrdersService>(OrdersService());
}
