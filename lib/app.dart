import 'package:jmorder_app/bloc/auth/auth_state.dart';
import 'package:jmorder_app/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:jmorder_app/bloc/bottom_navigation/bottom_navigation_state.dart';
import 'package:jmorder_app/bloc/clients/clients_bloc.dart';
import 'package:jmorder_app/bloc/clients/clients_state.dart';
import 'package:jmorder_app/utils/router.dart';
import 'package:jmorder_app/widgets/pages/auth_page.dart';

import 'bloc/auth/auth_bloc.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetIt.I.allReady(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(
                create: (BuildContext context) => AuthBloc(AuthInitialState()),
              ),
              BlocProvider<BottomNavigationBloc>(
                create: (BuildContext context) =>
                    BottomNavigationBloc(ViewLoading()),
              ),
              BlocProvider<ClientsBloc>(
                create: (context) => ClientsBloc(ClientsLoadingState()),
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: AuthPage.routeName,
              theme: new ThemeData(
                primarySwatch: Colors.pink,
                primaryColor: const Color(0xFFFF0844),
                accentColor: const Color(0xFFFF0844),
                canvasColor: const Color(0xFFfafafa),
              ),
              localizationsDelegates: [
                FlutterI18nDelegate(
                  translationLoader: FileTranslationLoader(
                      basePath: "assets/i18n", fallbackFile: "ko"),
                  missingTranslationHandler: (key, locale) {
                    print(
                        "--- Missing Key: $key, languageCode: ${locale.languageCode}");
                  },
                ),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              onGenerateRoute: Router.generateRoute,
            ),
          );
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
            ),
          ),
        );
      },
    );
  }
}
