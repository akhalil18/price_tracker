import 'dart:convert';
import 'dart:developer';

import 'package:web_socket_channel/io.dart';
import 'base_socket_service.dart';

class SocketService extends BaseSocketService {
  IOWebSocketChannel? _channel;
  Stream? dataStream;

  @override
  void close() {
    _channel?.sink.close();
  }

  @override
  bool connect(String url) {
    try {
      _channel = IOWebSocketChannel.connect(Uri.parse(url));
      dataStream = _channel?.stream;
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  void sendData(Map<String, dynamic> data) {
    _channel?.sink.add(json.encode(data));
  }
}
