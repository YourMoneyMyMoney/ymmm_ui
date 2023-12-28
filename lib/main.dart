import 'package:flutter/material.dart';
import 'package:ymmm_ui/src/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
    await dotenv.load();
    runApp(MyApp());
}
