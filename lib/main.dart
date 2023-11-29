import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:ymmm_ui/User/AuthManage.dart';
import 'package:ymmm_ui/User/SignPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: LoginMainPage(title: 'Sign Page'),
    );
  }
}

class LoginMainPage extends StatefulWidget {
  const LoginMainPage({super.key, required this.title});

  final String title;

  @override
  State<LoginMainPage> createState() => _LoginMainPageState();
}

class _LoginMainPageState extends State<LoginMainPage> {
  var auth = AuthManage();
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
                  MaterialPageRoute(builder: (context)=>const SignUp()),
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
                MaterialPageRoute(builder: (context)=>const SignUp()),
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
