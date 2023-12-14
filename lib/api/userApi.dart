import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

const apiUrl = "https://ymmm-core.vercel.app/api";
Future<http.Response> createAccountToApi(String email, String password, String platform) async {
  final response = await http.post(
    Uri.parse('${apiUrl}/user'),
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

Future<http.Response> loginToApi(String email, String password, String platform)async{
  final response = await http.post(
      Uri.parse('${apiUrl}/login'),
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