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
    preferences.setString(prefsKeyControllerHost, host);
  }

  String get machineAddress {
    return preferences.getString(prefsKeyMachineAddress);
  }

  set machineAddress(String address) {
    preferences.setString(prefsKeyMachineAddress, address);
  }

  String get machineMac {
    return preferences.getString(prefsKeyMachineMac);
  }

  set machineMac(String mac) {
    preferences.setString(prefsKeyMachineMac, mac);
  }

  String get machineSshKeyPath {
    return preferences.getString(prefsKeyMachineSshKeyPath);
  }

  set machineSshKeyPath(String sshKeyPath) {
    preferences.setString(prefsKeyMachineSshKeyPath, sshKeyPath);
  }

  int get machineSshPort {
    return preferences.getInt(prefsKeyMachineSshPort);
  }

  set machineSshPort(int port) {
    preferences.setInt(prefsKeyMachineSshPort, port);
  }

  String get machineUser {
    return preferences.getString(prefsKeyMachineUser);
  }

  set machineUser(String user) {
    preferences.setString(prefsKeyMachineUser, user);
  }
}
