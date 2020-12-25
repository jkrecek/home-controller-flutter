import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final String controllerHost;
  final String machineAddress;
  final String machineMac;
  final String machineUser;
  final int machineSshPort;
  final String machineSshKeyPath;

  const SettingsLoaded(
      {this.controllerHost,
      this.machineAddress,
      this.machineMac,
      this.machineSshKeyPath,
      this.machineSshPort,
      this.machineUser});

  @override
  List<Object> get props => [
        controllerHost,
        machineAddress,
        machineMac,
        machineSshKeyPath,
        machineSshPort,
        machineUser
      ];
}
