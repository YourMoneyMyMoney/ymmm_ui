import 'package:flutter/material.dart';
import 'package:ymmm_ui/User/SignDonePage.dart';

class EmainVerificationPage extends StatefulWidget {

  const EmainVerificationPage({super.key, required this.processEmail});
  final String processEmail;

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
              margin: const EdgeInsets.only(bottom:40),
              child: const Text('Verify your email address',style: TextStyle(fontSize: 24, fontFamily: 'Poppins', fontWeight:FontWeight.w800,)),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Text('Enter the ETP code that we sent to your email ${widget.processEmail}',style: const TextStyle(fontSize: 10, fontFamily: 'Poppins', fontWeight:FontWeight.w500,)),
            ),
            Container(
              margin: const EdgeInsets.only(top:5),
              child: const Text('Be careful not to share the code with anyone.',style: TextStyle(fontSize: 10, fontFamily: 'Poppins', fontWeight:FontWeight.w500,)),
            ),
            Container(
              margin: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 54,
                    height: 54,
                    padding: const EdgeInsets.symmetric(horizontal:4),
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
                    padding: const EdgeInsets.symmetric(horizontal:4),
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
                    padding: const EdgeInsets.symmetric(horizontal:4),
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
                    padding: const EdgeInsets.symmetric(horizontal:4),
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
              margin: const EdgeInsets.symmetric( horizontal: 20,),
              child: ElevatedButton(onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>const SignDonePage()),
                  ),
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 97, 100, 107),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(325, 55),
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