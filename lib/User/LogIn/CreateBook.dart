import 'package:flutter/material.dart';

class CreateBook extends StatefulWidget {
  const CreateBook({super.key});

  @override
  State<StatefulWidget> createState() => _CreateBookState();
}

class _CreateBookState extends  State<CreateBook> {
  final TextEditingController _titleFilter = new TextEditingController();
  final TextEditingController _currencyFilter = new TextEditingController();
  final TextEditingController _membersFilter = new TextEditingController();
  String _title = "";
  String _currency = "";
  String _members = "";


  _SignPageState() {
    _titleFilter.addListener(_titleListen);
    _currencyFilter.addListener(_currencyListen);
    _membersFilter.addListener(_membersListen);
  }

  @override 
  void initState(){ 
    super.initState(); 
  } 

  void _titleListen() {
    if (_titleFilter.text.isEmpty) {
      _title = "";
    } else {
      _title = _titleFilter.text;
    }
  }

  void _currencyListen() {
    if (_currencyFilter.text.isEmpty) {
      _currency = "";
    } else {
      _currency = _currencyFilter.text;
    }
  }

  void _membersListen() {
    if (_membersFilter.text.isEmpty) {
      _members = "";
    } else {
      _members = _membersFilter.text;
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
              child: const Text('Create your money helper', style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight:FontWeight.w800,)),
            ),
            Container(
              height: 47,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _titleFilter,
                decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
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
                controller: _currencyFilter,
                decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Currency',
                ),
              ),
            ),  
            Container(
              height: 65,
              padding: const EdgeInsets.only(
                left: 20.0, 
                right: 20.0, 
                top: 15, 
                bottom: 5
              ),
              child: TextField(
                controller: _membersFilter,
                decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Invite Others',
                ),
              ),
            ),  
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric( horizontal: 20,),
              child: ElevatedButton(onPressed: () => {print("submit tracker") }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 97, 100, 107),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(325, 55),
                ), 
                child: const Text('Submit',style: TextStyle(fontSize: 16, fontFamily: 'Work Sans'),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}