import 'package:flutter/material.dart';
import 'package:ymmm_ui/User/LoginMainPage.dart';
import 'package:ymmm_ui/service/userApi.dart';

class CreateBook extends StatefulWidget {
  late Map<int, String> currencyList;
  
  CreateBook({super.key, required this.currencyList});

  @override
  State<StatefulWidget> createState() => _CreateBookState();
}

class _CreateBookState extends  State<CreateBook> {
  final TextEditingController _titleFilter = new TextEditingController();
  final TextEditingController _membersFilter = new TextEditingController();
  String _title = "";
  String _members = "";
  late String dropdownValue;


  _SignPageState() {
    _titleFilter.addListener(_titleListen);
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
              height: 80,
              padding: const EdgeInsets.only(
                left: 20.0, 
                right: 20.0, 
                top: 20, 
                bottom: 5
              ),
              child: DropdownButtonFormField(
                value: widget.currencyList.entries.first.value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: [
                  for (MapEntry<int, String> e in widget.currencyList.entries) DropdownMenuItem(
                    value: e.value,
                    child: Text(e.value),
                  ),
                ],
              )
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
              child: ElevatedButton(onPressed: () => {
                  print(_membersFilter.text),
                  print(_titleFilter.text),
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 97, 100, 107),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(325, 55),
                ), 
                child: const Text('Submit',style: TextStyle(fontSize: 16, fontFamily: 'Work Sans'),),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric( horizontal: 20,),
              child: ElevatedButton(onPressed: () => {
                logOut(),
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginMainPage()))
               }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 97, 100, 107),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(325, 55),
                ), 
                child: const Text('Logout',style: TextStyle(fontSize: 16, fontFamily: 'Work Sans'),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}