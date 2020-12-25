import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_controller/bloc/settings/settings.dart';

class MachineSettings extends StatelessWidget {
  MachineSettings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      if (state is SettingsLoaded) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Machine address"),
                  controller: TextEditingController(text: state.machineAddress),
                  onSubmitted: (String value) {
                    BlocProvider.of<SettingsBloc>(context)
                        .add(SettingsChange(machineAddress: value));
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Machine MAC"),
                  controller: TextEditingController(text: state.machineMac),
                  onSubmitted: (String value) {
                    BlocProvider.of<SettingsBloc>(context)
                        .add(SettingsChange(machineMac: value));
                  },
                ),
                TextField(
                  decoration:
                      InputDecoration(labelText: "Machine SSH key path"),
                  controller:
                      TextEditingController(text: state.machineSshKeyPath),
                  onSubmitted: (String value) {
                    BlocProvider.of<SettingsBloc>(context)
                        .add(SettingsChange(machineSshKeyPath: value));
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Machine SSH port"),
                  controller: TextEditingController(
                      text: state.machineSshPort?.toString()),
                  onSubmitted: (String value) {
                    BlocProvider.of<SettingsBloc>(context).add(SettingsChange(
                        machineSshPort:
                            value != null ? int.parse(value) : null));
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Machine SSH user"),
                  controller: TextEditingController(text: state.machineUser),
                  onSubmitted: (String value) {
                    BlocProvider.of<SettingsBloc>(context)
                        .add(SettingsChange(machineUser: value));
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
