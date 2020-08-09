import 'package:jmorder_app/bloc/auth/auth_state.dart';
import 'package:jmorder_app/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:jmorder_app/bloc/bottom_navigation/bottom_navigation_state.dart';
import 'package:jmorder_app/widgets/pages/main_page.dart';
import 'package:jmorder_app/widgets/pages/auth_page.dart';
import 'package:jmorder_app/widgets/pages/sign_up_page.dart';

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
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/login',
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
              routes: {
                '/': (context) => MainPage(),
                '/login': (context) => AuthPage(),
                '/signup': (context) => SignUpPage(),
              },
            ),
          );
        }
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Color(0xFFF47400), Color(0xFFF0EB09)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
