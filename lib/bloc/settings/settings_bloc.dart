import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_controller/bloc/settings/settings.dart';
import 'package:home_controller/services/app_container.dart';
import 'package:home_controller/services/services.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  AppContainer appContainer;

  SettingsBloc({this.appContainer}) : super(SettingsInitial()) {
    add(SettingsReload());
  }

  ConfigurationRepository get repository {
    return appContainer.repository;
  }

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is SettingsReload) {
      yield* _mapSettingsReloadToState(event);
    } else if (event is SettingsChange) {
      _runSettingsChange(event);
    } else {
      throw UnimplementedError();
    }
  }

  Stream<SettingsState> _mapSettingsReloadToState(SettingsReload event) async* {
    yield SettingsLoaded(
        controllerHost: repository.controllerHost,
        machineAddress: repository.machineAddress,
        machineMac: repository.machineMac,
        machineSshKeyPath: repository.machineSshKeyPath,
        machineSshPort: repository.machineSshPort,
        machineUser: repository.machineUser);
  }

  void _runSettingsChange(SettingsChange event) {
    if (event.controllerHost != null) {
      repository.controllerHost = event.controllerHost;
    }
    if (event.machineAddress != null) {
      repository.machineAddress = event.machineAddress;
    }
    if (event.machineMac != null) {
      repository.machineMac = event.machineMac;
    }
    if (event.machineSshKeyPath != null) {
      repository.machineSshKeyPath = event.machineSshKeyPath;
    }
    if (event.machineSshPort != null) {
      repository.machineSshPort = event.machineSshPort;
    }
    if (event.machineUser != null) {
      repository.machineUser = event.machineUser;
    }

    add(SettingsReload());
  }
}
