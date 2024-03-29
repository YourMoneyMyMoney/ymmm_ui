import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ymmm_ui/User/LogIn/CreateBook.dart';
import 'package:ymmm_ui/User/SignUp/SignPage.dart';
import 'package:ymmm_ui/service/bookApi.dart';
import 'package:ymmm_ui/service/userApi.dart';
import 'package:ymmm_ui/auth.config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ymmm_ui/src/pages/Layout.dart';
import 'package:ymmm_ui/service/jwtService.dart';

import '../../models/model.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  bool passwordVisible = false;
  late String userInfo;
  static final storage = FlutterSecureStorage();

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  @override 
  void initState(){ 
    super.initState(); 
    passwordVisible=true; 
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

  void login() async {
    // NEED TO IMPLEMENTED API FIRST
    final response = await loginToApi(_emailFilter.text, _passwordFilter.text, 'ymmm');
    if(response.statusCode == 200){
      // logIn(response,storage);
      Map<String, dynamic> data =jsonDecode(response.body);
      String token = data["token"];
      Map<String, dynamic> payload = parseJwt(token);
      var val = jsonEncode(Login(payload["userId"].toString(), payload["email"],payload["name"], payload["platform"]));
      await storage.write( key: 'login', value: val );
      await storage.write( key: 'token', value: token);
      moveAfterLogin();
    }
  }

  void moveAfterLogin() async {
    Map<int, String> bookList = {};
    final bookResponse = await getBooks();
    if(bookResponse.statusCode == 200){
      var data = jsonDecode(bookResponse.body);
      data.forEach((book)=>{
        bookList[book['book']['id']] = book['book']['title']
      });
    }
    if(bookList.isEmpty){
      Map<int, String> currencyList = {};
      final response = await getCurrencies();
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        data.forEach((currency)=>{
          currencyList[currency['id']] = currency['name']
        });
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateBook(currencyList: currencyList,)));
      }
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Layout()));
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
              margin: const EdgeInsets.only(left:20, bottom: 50),
              child: const Text('Login', style: TextStyle(fontSize: 32, fontFamily: 'Poppins', fontWeight:FontWeight.w800,)),
            ),
            Container(
              height: 47,
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
              height: 70,
              padding: const EdgeInsets.only(
                left: 20.0, 
                right: 20.0, 
                top: 20, 
                bottom: 5
              ),
              child: TextField(
                controller: _passwordFilter,
                obscureText: passwordVisible,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible 
                          ? Icons.visibility_outlined  
                          : Icons.visibility_off_outlined, color:Color.fromARGB(255, 115, 118, 126),),
                      onPressed: () {
                        setState(
                          (){
                            passwordVisible = !passwordVisible;
                          }
                        );
                      },
                    ),
                ),
              ),
            ),  
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left:21, bottom: 30, top: 10),
              child: 
                  Text('Forgot password?', 
                                style: TextStyle(
                                  fontSize:10, color: Color.fromARGB(255, 0, 0, 0), 
                                  fontFamily: 'Poppins', 
                                  fontWeight: FontWeight.w500)
                  ),
            ),
            Container(
              margin: const EdgeInsets.symmetric( horizontal: 20,),
              child: ElevatedButton(onPressed: () => { login() }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 97, 100, 107),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(325, 55),
                ), 
                child: const Text('Login',style: TextStyle(fontSize: 16, fontFamily: 'Work Sans'),),
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
                    child: const Text("or Login with", style: TextStyle(
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
                      print('go to google login page')
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
                      print('go to facebook login page')
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
                  const Text('Don’t have an account? ',style: TextStyle(
                                                          fontSize:12, color: Color.fromARGB(255, 97, 100, 107), 
                                                          fontFamily: 'Poppins', 
                                                          fontWeight: FontWeight.w500)),
                  TextButton(
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignPage()))
                    }, 
                    style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: const Size(50, 30),
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          alignment: Alignment.centerLeft),
                    child: const Text('Sign Up', style: TextStyle(
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