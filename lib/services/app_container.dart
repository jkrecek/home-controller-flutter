import 'package:home_controller/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppContainer {
  ConfigurationRepository repository;
  ApiService apiService;

  AppContainer(SharedPreferences preferences) : super() {
    repository = ConfigurationRepository(preferences: preferences);
    apiService = ApiService(repository: repository);
  }

  static Future<AppContainer> load() async {
    var preferences = await SharedPreferences.getInstance();
    return new AppContainer(preferences);
  }
}
