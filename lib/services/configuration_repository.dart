import 'package:shared_preferences/shared_preferences.dart';

final String prefsKeyControllerHost = 'controllerHost';
final String prefsKeyMachineAddress = 'machineAddress';
final String prefsKeyMachineMac = 'machineMac';
final String prefsKeyMachineSshKeyPath = 'machineSshKeyPath';
final String prefsKeyMachineSshPort = 'machineSshPort';
final String prefsKeyMachineUser = 'machineUser';

class ConfigurationRepository {
  final SharedPreferences preferences;

  const ConfigurationRepository({this.preferences});

  String get controllerHost {
    return preferences.getString(prefsKeyControllerHost);
  }

  set controllerHost(String host) {
    preferences.getString(prefsKeyControllerHost);
  }

  String get machineAddress {
    return preferences.getString(prefsKeyMachineAddress);
  }

  set machineAddress(String address) {
    preferences.getString(prefsKeyMachineAddress);
  }

  String get machineMac {
    return preferences.getString(prefsKeyMachineMac);
  }

  set machineMac(String mac) {
    preferences.getString(prefsKeyMachineMac);
  }

  String get machineSshKeyPath {
    return preferences.getString(prefsKeyMachineSshKeyPath);
  }

  set machineSshKeyPath(String sshKeyPath) {
    preferences.getString(prefsKeyMachineSshKeyPath);
  }

  int get machineSshPort {
    return preferences.getInt(prefsKeyMachineSshPort);
  }

  set machineSshPort(int port) {
    preferences.getInt(prefsKeyMachineSshPort);
  }

  String get machineUser {
    return preferences.getString(prefsKeyMachineUser);
  }

  set machineUser(String user) {
    preferences.getString(prefsKeyMachineUser);
  }
}
