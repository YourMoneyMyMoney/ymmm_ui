import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

var apiUrl =  dotenv.env['API_URL'];

const storage = FlutterSecureStorage();

Future<http.Response> getBooks() async {
  dynamic token = await storage.read(key: "token");
  final response = await http.get(
    Uri.parse('$apiUrl/book'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'token': token,
    },);
  return response;
}

Future<http.Response> getCurrencies() async {
  final response = await http.get(
    Uri.parse('$apiUrl/currency'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
  return response;
}

