import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ymmm_ui/User/SignDonePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:email_auth/email_auth.dart';

class EmainVerificationPage extends StatefulWidget {

  const EmainVerificationPage({super.key, required this.processEmail, required this.processPwd, required this.processPlatform, required this.emailAuth});
  final String processEmail;
  final String processPwd;
  final String processPlatform;
  final EmailAuth emailAuth;

  @override
  State<StatefulWidget> createState() => _EmailVerificationPageState();

}
class _EmailVerificationPageState extends State<EmainVerificationPage> {
  final TextEditingController _code1Filter = new TextEditingController();
  final TextEditingController _code2Filter = new TextEditingController();
  final TextEditingController _code3Filter = new TextEditingController();
  final TextEditingController _code4Filter = new TextEditingController();

  String _code1 = "";
  String _code2 = "";
  String _code3 = "";
  String _code4 = "";
  // late EmailAuth emailAuth;
  
  _EmailVerificationPageState(){
    _code1Filter.addListener(_code1Listen);
    _code2Filter.addListener(_code2Listen);
    _code3Filter.addListener(_code3Listen);
    _code4Filter.addListener(_code4Listen);
  } 

  void _code1Listen(){
    if(_code1Filter.text.isEmpty){
      _code1 = "";
    } else {
      _code1 = _code1Filter.text;
    }
  }

  void _code2Listen(){
    if(_code2Filter.text.isEmpty){
      _code2 = "";
    } else {
      _code2 = _code2Filter.text;
    }
  }

  void _code3Listen(){
    if(_code3Filter.text.isEmpty){
      _code3 = "";
    } else {
      _code3 = _code3Filter.text;
    }
  }

  void _code4Listen(){
    if(_code4Filter.text.isEmpty){
      _code4 = "";
    } else {
      _code4 = _code4Filter.text;
    }
  }

  void createAccount(String email, String password, String platform) async {
    final response = await http.post(
      Uri.parse('${dotenv.env['API_URL']}/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'platform': platform
      }),
    );
    print('${response.body}');
  }

  void verify() {
    var otp = _code1Filter.text+_code2Filter.text+_code3Filter.text+_code4Filter.text;
    var res = widget.emailAuth.validateOtp(recipientMail: widget.processEmail, userOtp: otp);
    if(res){
      createAccount(widget.processEmail,widget.processPwd,widget.processPlatform);
    }else{
      print("fail");
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
          children:<Widget>[
            Container(
              margin: const EdgeInsets.only(bottom:30),
              child: const Text('Verify your email address',style: TextStyle(fontSize: 24, fontFamily: 'Poppins', fontWeight:FontWeight.w800,)),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: const Text('We’ve sent a code to ymmmpaln@gmail.com',style: const TextStyle(fontSize: 10, fontFamily: 'Poppins', fontWeight:FontWeight.w500,)),
            ),
            Container(
              margin: const EdgeInsets.only(top:5),
              child: Text('${widget.processEmail}',style: TextStyle(fontSize: 10, fontFamily: 'Poppins', fontWeight:FontWeight.w500,)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 54,
                    height: 54,
                    padding: const EdgeInsets.symmetric(horizontal:8),
                    child: TextField(
                      controller: _code1Filter,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(217, 217, 217, 1),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    width: 54,
                    height: 54,
                    padding: const EdgeInsets.symmetric(horizontal:8),
                    child: TextField(
                      controller: _code2Filter,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(217, 217, 217, 1),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                   Container(
                    width: 54,
                    height: 54,
                    padding: const EdgeInsets.symmetric(horizontal:8),
                    child: TextField(
                      controller: _code3Filter,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(217, 217, 217, 1),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                   Container(
                    width: 54,
                    height: 54,
                    padding: const EdgeInsets.symmetric(horizontal:8),
                    child: TextField(
                      controller: _code4Filter,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(217, 217, 217, 1),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('I didn’t receive a code ',style: TextStyle(
                                                          fontSize:12, color: Color.fromARGB(255, 97, 100, 107), 
                                                          fontFamily: 'Poppins', 
                                                          fontWeight: FontWeight.w500)),
                  TextButton(
                    onPressed: () => {
                      print('Resenc the code'),
                    }, 
                    style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: const Size(50, 30),
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          alignment: Alignment.centerLeft),
                    child: const Text('Resend', style: TextStyle(
                                                          fontSize:12, color: Color.fromARGB(255, 97, 100, 107), 
                                                          fontFamily: 'Poppins', 
                                                          fontWeight: FontWeight.w700)                                
                    ),
                  ),
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.symmetric( horizontal: 20,),
              child: ElevatedButton(onPressed: () => {
                  verify(),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>const SignDonePage()),
                  ),
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 97, 100, 107),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(325, 55),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                ), 
                child: const Text('Verify Email',style: TextStyle(fontSize: 16, fontFamily: 'Work Sans'),),
              ),
            ),
          ],
        ),
      ),
    );  
  }
}