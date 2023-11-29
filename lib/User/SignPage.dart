import 'package:flutter/material.dart';
import 'package:ymmm_ui/User/EmailVerificationPage.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignPageState();
}

class _SignPageState extends  State<SignPage> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";

  _SignPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  @override
  Widget build (BuildContext context) { 
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left:20, bottom: 15),
              child: const Text('Create Account', style: TextStyle(fontSize: 32, fontFamily: 'Poppins', fontWeight:FontWeight.w800,)),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left:20, bottom: 40),
              child: const Text('Create your account to manage your finance',style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight:FontWeight.w400,)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _emailFilter,
                decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'abc@gmail.com'
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20.0, 
                right: 20.0, 
                top: 20, 
                bottom: 5
              ),
              child: TextField(
                controller: _passwordFilter,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'
                ),
              ),
            ),  
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left:21, bottom: 30),
              child: const Text('8 characters minimum', 
                                style: TextStyle(
                                  fontSize:10, color: Color.fromARGB(255, 97, 100, 107), 
                                  fontFamily: 'Poppins', 
                                  fontWeight: FontWeight.w500)
                                ),
            ),
            Container(
              margin: const EdgeInsets.symmetric( horizontal: 20,),
              child: ElevatedButton(onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>EmainVerificationPage(processEmail:_email)),
                  ),
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 97, 100, 107),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(325, 55),
                ), 
                child: const Text('Create Account',style: TextStyle(fontSize: 16, fontFamily: 'Work Sans'),),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left:21, right:21, top:30, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Expanded(
                      child: Divider(color: Color.fromARGB(255, 97, 100, 107),  thickness: 2,)
                  ),       
                  Container(
                    margin: const EdgeInsets.only(left:7, right:7),
                    child: const Text("or sign in with", style: TextStyle(
                                                          fontSize:10, color: Color.fromARGB(255, 97, 100, 107), 
                                                          fontFamily: 'Poppins', 
                                                          fontWeight: FontWeight.w500)),   
                  ),     
                  const Expanded(
                      child: Divider(color: Color.fromARGB(255, 97, 100, 107), thickness: 2,)
                  ),
                ]
              )
            ),
            // Social Login service implements
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin:const EdgeInsets.only(right: 20),
                  child: ElevatedButton(onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>EmainVerificationPage(processEmail:_email)),
                      ),
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(140, 50),
                    ), 
                    child: Image.asset('assets/images/Logo/googleLogo.png'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left:20),
                  child: ElevatedButton(onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>EmainVerificationPage(processEmail:_email)),
                      ),
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(140, 50),
                    ), 
                    child: Image.asset('assets/images/Logo/facebookLogo.png'),
                  ),
                ),
              ],           
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Already have an account? ',style: TextStyle(
                                                          fontSize:12, color: Color.fromARGB(255, 97, 100, 107), 
                                                          fontFamily: 'Poppins', 
                                                          fontWeight: FontWeight.w500)),
                  TextButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>EmainVerificationPage(processEmail:_email)),
                      ),
                    }, 
                    style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: const Size(50, 30),
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          alignment: Alignment.centerLeft),
                    child: const Text('Log In', style: TextStyle(
                                                          fontSize:12, color: Color.fromARGB(255, 97, 100, 107), 
                                                          fontFamily: 'Poppins', 
                                                          fontWeight: FontWeight.w700)                                
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}