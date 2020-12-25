import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_controller/bloc/settings/settings.dart';
import 'package:home_controller/widgets/settings_widgets/settings_widgets.dart';

class Settings extends StatelessWidget {
  Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            titleSpacing: 0,
            title: Text("Settings"),
            bottom: TabBar(
              tabs: [
                Tab(text: "Controller".toUpperCase()),
                Tab(text: "Machine".toUpperCase()),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ControllerSettings(),
              MachineSettings(),
            ],
          ),
        ),
      );
    });
  }
}
