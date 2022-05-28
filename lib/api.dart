import 'package:http/http.dart' as http;

Future<http.Response> requestDollarRate() async {
  String api = 'https://LBP-DollarRate-API.murfyy.repl.co/api/v1/dollarRate';
  return http.get(Uri.parse(api));
}
