import 'package:green_leaf_app/const.dart';
import 'package:http/http.dart' as http;

class RemoteFoodService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/meals';

  Future<dynamic> get() async {
    try {
      var response = await client.get(Uri.parse('$remoteUrl?populate=*'));
      return response;
    } catch (e) {
      return "Error connecting to Server";
    }
  }
}
