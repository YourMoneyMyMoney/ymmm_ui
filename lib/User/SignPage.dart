import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ymmm_ui/User/EmailVerificationPage.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Create Account'),
            const Text('Create your account to manage your finance'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 15.0, 
                right: 15.0, 
                top: 15, 
                bottom: 0
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),  
            ElevatedButton(
              onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>const EmainVerification()),
              ),
            }, 
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}