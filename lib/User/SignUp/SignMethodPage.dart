import 'package:flutter/material.dart';
import 'package:ymmm_ui/User/LogIn/LoginPage.dart';
import 'package:ymmm_ui/User/SignUp/SignPage.dart';

class SignMethodPage extends StatefulWidget {
  const SignMethodPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignMethodPageState();
}

class _SignMethodPageState extends  State<SignMethodPage> {

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
              margin:const EdgeInsets.all(12),
              child: ElevatedButton(onPressed: () => {
                  print('go to google login page')
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 245, 245, 245),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  minimumSize: const Size(140, 60),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                ), 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Image.asset('assets/images/Logo/googleLogo.png'),
                    ),
                    Text("Continue with Google", style: TextStyle(fontSize: 14, fontFamily: 'Work Sans', fontWeight:FontWeight.w400,),),
                  ]
                ),
              ),
            ),
            Container(
              margin:const EdgeInsets.all(12),
              child: ElevatedButton(onPressed: () => {
                  print('go to facebook login page')
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 245, 245, 245),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  minimumSize: const Size(140, 60),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                ), 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Image.asset('assets/images/Logo/facebookLogo.png'),
                    ),
                    const Text("Continue with FaceBook",style: TextStyle(fontSize: 14, fontFamily: 'Work Sans', fontWeight:FontWeight.w400,),),
                  ]
                ),
              ),
            ),
            Container(
              margin:const EdgeInsets.all(12),
              child: ElevatedButton(onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>SignPage()),
                  ),
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 245, 245, 245),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  minimumSize: const Size(140, 60),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                ), 
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Padding(
                      padding:EdgeInsets.only(right: 10),
                      child: Icon(Icons.email,),
                    ),
                    Text("Continue with Email",style: TextStyle(fontSize: 14, fontFamily: 'Work Sans', fontWeight:FontWeight.w400,),),
                  ]
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
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
                        MaterialPageRoute(builder: (context)=>LoginPage()),
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