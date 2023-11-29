import 'package:flutter/material.dart';

class EmainVerification extends StatelessWidget{
  const EmainVerification({super.key});

  @override
  Widget build (BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children:[
            Text('Verify your email address'),
            Text('Enter the ETP code that we sent to your email '),
            Text('Be careful not to share the code with anyone.'),
            Row(
              children:[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:3),
                  child: TextField(
                  decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  child: TextField(
                  decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  child: TextField(
                  decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  child: TextField(
                  decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        ),
                  ),
                ),
              ]
            ),
          ],
        ),
      ),
    );  
  }
}