abstract class BaseSocketService {
  bool connect(String url);
  void close();
  void sendData(Map<String, dynamic> data);
}
