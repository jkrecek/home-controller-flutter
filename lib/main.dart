import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_controller/bloc/dashboard/dashboards.dart';
import 'package:home_controller/bloc/main/mains.dart';
import 'package:home_controller/bloc/settings/settings.dart';
import 'package:home_controller/routes.dart';
import 'package:home_controller/services/app_container.dart';
import 'package:home_controller/widgets/widgets.dart';

void main() {
  runApp(BlocProvider(create: (context) => MainBloc(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Home Controller',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            accentColor: Colors.purple),
        themeMode: ThemeMode.system,
        routes: {
          Routes.dashboard: (context) {
            return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
              return state is MainLoaded
                  ? BlocProvider(
                      create: (context) =>
                          DashboardBloc(appContainer: state.appContainer),
                      child: Dashboard())
                  : CircularProgressIndicator();
            });
          },
          Routes.settings: (context) {
            return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
              return state is MainLoaded
                  ? BlocProvider(
                      create: (context) =>
                          SettingsBloc(appContainer: state.appContainer),
                      child: Settings())
                  : CircularProgressIndicator();
            });
          }
        });
  }
}

class Loading extends StatelessWidget {
  final Future<AppContainer> appLoader = AppContainer.load();

  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
