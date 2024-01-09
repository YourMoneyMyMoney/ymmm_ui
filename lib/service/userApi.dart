import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var apiUrl =  dotenv.env['API_URL'];

const storage = FlutterSecureStorage();

Future<http.Response> createAccountToApi(String email, String password, String name, String platform) async {
  final response = await http.post(
    Uri.parse('$apiUrl/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
      'name': name,
      'platform': platform
    }),
  );
  return response;
}

Future<http.Response> loginToApi(String email, String password, String platform)async{
  final response = await http.post(
      Uri.parse('$apiUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'platform': platform
      }),
    );
  return response;
}

void logOut() async {
  await  storage.delete(key: "login");
  await  storage.delete(key: "token");
}