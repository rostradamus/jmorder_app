import 'package:jmorder_app/bloc/auth/orders/orders_bloc.dart';
import 'package:jmorder_app/bloc/auth/orders/orders_state.dart';
import 'package:jmorder_app/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:jmorder_app/bloc/bottom_navigation/bottom_navigation_event.dart';
import 'package:jmorder_app/bloc/bottom_navigation/bottom_navigation_state.dart';
import 'package:jmorder_app/bloc/clients/clients_bloc.dart';
import 'package:jmorder_app/bloc/clients/clients_state.dart';
import 'package:jmorder_app/widgets/components/shared/app_bar_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:jmorder_app/bloc/auth/auth_bloc.dart';
import 'package:jmorder_app/bloc/auth/auth_state.dart';
import 'package:jmorder_app/widgets/components/shared/custom_bottom_navigation_bar.dart';
import 'package:jmorder_app/widgets/views/friends_view.dart';
import 'package:jmorder_app/widgets/views/home_view.dart';
import 'package:jmorder_app/widgets/views/orders_view.dart';
import 'package:jmorder_app/widgets/views/settings_view.dart';
import 'package:jmorder_app/widgets/views/clients_view.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BottomNavigationBloc>(context).add(MainPageLoaded());
    return Scaffold(
      appBar: GradientAppBar(
        automaticallyImplyLeading: false,
        gradient: AppBarGradient(),
        title: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            String message = FlutterI18n.translate(
              context,
              "main.app_bar.not_logged_in",
            );
            if (state is LoginSuccessState) {
              message = FlutterI18n.translate(
                context,
                "main.app_bar.greeting",
                translationParams: {"name": state.auth.user.firstName},
              );
            }
            return Text(
              message,
              textAlign: TextAlign.center,
            );
          },
        ),
      ),
      body: SafeArea(
        top: false,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LogoutSuccessState) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (r) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthRequestState) {
              return Center(child: CircularProgressIndicator());
            }
            return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              builder: (context, state) {
                if (state is ViewLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is HomeViewState) return HomeView();
                if (state is FriendsViewState) return FriendsView();
                if (state is PlanViewState)
                  return BlocProvider<OrdersBloc>(
                    create: (context) => OrdersBloc(OrdersLoadingState()),
                    child: OrdersView(),
                  );
                if (state is ClientsViewState)
                  return BlocProvider<ClientsBloc>(
                    create: (context) => ClientsBloc(ClientsLoadingState()),
                    child: ClientsView(),
                  );
                if (state is SettingsViewState) return SettingsView();
                return Container();
              },
            );
          },
        ),
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              builder: (context, state) => CustomBottomNavigationBar()),
    );
  }
}
