import 'package:http/http.dart' as http;

Future<http.Response> requestDollarRate() async {
  String api = 'https://rate.onrender.com/api/v1/dollarRate';
  return http.get(Uri.parse(api));
}
