import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_controller/bloc/settings/settings.dart';

class ControllerSettings extends StatelessWidget {
  ControllerSettings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      if (state is SettingsLoaded) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Controller address"),
                  controller: TextEditingController(text: state.controllerHost),
                  onSubmitted: (String value) {
                    BlocProvider.of<SettingsBloc>(context)
                        .add(SettingsChange(controllerHost: value));
                  },
                ),
              ],
            ));
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }
}
