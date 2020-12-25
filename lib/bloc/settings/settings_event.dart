import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsReload extends SettingsEvent {
  const SettingsReload();
}

class SettingsChange extends SettingsEvent {
  final String controllerHost;
  final String machineAddress;
  final String machineMac;
  final String machineUser;
  final int machineSshPort;
  final String machineSshKeyPath;

  const SettingsChange(
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
