import 'package:flutter/material.dart';
import 'package:ymmm_ui/User/SignUp/SignMethodPage.dart';
import 'package:ymmm_ui/User/LogIn/LoginPage.dart';

class LoginMainPage extends StatefulWidget {
  const LoginMainPage({super.key});

  @override
  State<LoginMainPage> createState() => _LoginMainPageState();
}

class _LoginMainPageState extends State<LoginMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin:const EdgeInsets.only(bottom: 60),
              child: const Column(
                children: <Widget>[
                  Text(
                    'Plan and spend',
                    style: TextStyle(fontWeight:FontWeight.w600, fontSize: 32, fontFamily: 'Poppins')
                  ),    
                  Text(
                    'your budget smart',
                    style: TextStyle(fontWeight:FontWeight.w600, fontSize: 32, fontFamily: 'Poppins')
                  ),    
                  Text(
                    'with YMMM',
                    style: TextStyle(fontWeight:FontWeight.w600, fontSize: 32, fontFamily: 'Poppins')
                  ),     
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom:20), 
              child: ElevatedButton(onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignMethodPage()),
                ),
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 97, 100, 107),
                  foregroundColor: Colors.white,
                  fixedSize: const Size(352, 55),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                ), 
                child: const Text('Create Account',style: TextStyle(fontSize: 16, fontFamily: 'Work Sans'),),
              ),
            ),
            ElevatedButton(onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              ),
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 245, 245, 245),
                foregroundColor: const Color.fromARGB(255, 97, 100, 107),
                fixedSize: const Size(352, 55),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
              ), 
              child: const Text('Sign in',style: TextStyle(fontSize: 16, fontFamily: 'Work Sans'),))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
