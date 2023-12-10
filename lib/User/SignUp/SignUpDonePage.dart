import 'package:flutter/material.dart';

class SignUpDonePage extends StatelessWidget {
  const SignUpDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20),
              child:  ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.check, color: Colors.black, size:60),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          backgroundColor: const Color.fromARGB(255, 217, 217, 217), // <-- Button color
                          minimumSize: const Size(85,85),
                        ),
                      )
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text('Completed!',style: TextStyle(fontSize: 24, fontFamily: 'Poppins', fontWeight:FontWeight.w800,)),
            ),
                      Container(
              margin: const EdgeInsets.only(top:40), 
              child: ElevatedButton(onPressed: () => {
                  print("go to login")
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 97, 100, 107),
                  foregroundColor: Colors.white,
                  fixedSize: const Size(352, 40),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                ), 
                child: const Text('Login',style: TextStyle(fontSize: 16, fontFamily: 'Work Sans'),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}