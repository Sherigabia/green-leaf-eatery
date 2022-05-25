import 'package:green_leaf_app/const.dart';
import 'package:green_leaf_app/models/foods_model.dart';
import 'package:http/http.dart' as http;

class RemoteFoodService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/foods';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$remoteUrl?populate=*'));
    return response;
  }
}
