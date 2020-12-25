import 'dart:async';
import 'dart:convert';

import 'package:home_controller/dto/status-stream.dart';
import 'package:home_controller/services/configuration_repository.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

class ApiService {
  final ConfigurationRepository repository;

  ApiService({this.repository});

  Function() closeStatusChannel = () {};

  Stream listenStatusStream() {
    closeStatusChannel();

    final channel = IOWebSocketChannel.connect(
        'ws://${repository.controllerHost}/status-stream?host=${repository.machineAddress}',
        headers: {"origin": "ws://${repository.controllerHost}"});

    // ignore: close_sinks
    StreamController<StatusStream> controller =
        StreamController<StatusStream>();
    channel.stream.listen((event) {
      var status = StatusStream.fromJson(jsonDecode(event));
      controller.add(status);
    });

    closeStatusChannel = () {
      channel.sink.close();
      controller.sink.close();
    };

    return controller.stream;
  }

  Future<http.Response> _post({String path, Object body}) {
    return http.post("http://${repository.controllerHost}/$path",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body));
  }

  bool isSuccess(http.Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  Future<bool> wake() async {
    var response = await _post(
        path: "wake", body: <String, dynamic>{"mac": repository.machineMac});
    return isSuccess(response);
  }

  Future<bool> halt() async {
    var response = await _post(path: "halt", body: <String, dynamic>{
      "user": repository.machineUser,
      "host": repository.machineAddress,
      "port": repository.machineSshPort,
      "private_key": {"path": repository.machineSshKeyPath}
    });
    return isSuccess(response);
  }

  void dispose() {
    closeStatusChannel();
  }
}
