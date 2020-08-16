import 'package:flutter/material.dart';
import 'package:jmorder_app/models/client.dart';
import 'package:jmorder_app/widgets/pages/auth_page.dart';
import 'package:jmorder_app/widgets/pages/client/client_detail_page.dart';
import 'package:jmorder_app/widgets/pages/main_page.dart';
import 'package:jmorder_app/widgets/pages/order/add_order_page.dart';
import 'package:jmorder_app/widgets/pages/sign_up_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainPage.routeName:
        var targetIndex = (settings.arguments as int) ?? 0;
        return MaterialPageRoute(
            builder: (_) => MainPage(
                  targetIndex: targetIndex,
                ));
      case AuthPage.routeName:
        return MaterialPageRoute(builder: (_) => AuthPage());
      case SignUpPage.routeName:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case AddOrderPage.routeName:
        return MaterialPageRoute(builder: (_) => AddOrderPage());
      case ClientDetailPage.routeName:
        var client = settings.arguments as Client;
        return MaterialPageRoute(
            builder: (_) => ClientDetailPage(client: client));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
