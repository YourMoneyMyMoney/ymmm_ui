import 'package:flutter/material.dart';

class SignDonePage extends StatelessWidget {
  const SignDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20),
              child: const Icon(Icons.check_circle),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text('Completed!',style: TextStyle(fontSize: 24, fontFamily: 'Poppins', fontWeight:FontWeight.w800,)),
            ),
          ],
        ),
      ),
    );
  }
}