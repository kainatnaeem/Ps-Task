import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pstask/authentication/wrap.dart';
import 'package:pstask/services/authservices.dart';


import 'authentication/registration.dart';
import 'authentication/signin.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "api key",
      appId: "com.example.pstask",
      messagingSenderId:
          "sender id",
      projectId: "pstask",
    ));


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        )
      ],
   child: MaterialApp(
      title: 'PS Task',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      ),debugShowCheckedModeBanner: false,
    initialRoute: '/',
          routes: {
            '/': (context) => const Wrapper(),
            '/login': (context) => const SignIn(),
            '/register': (context) => Register(),
           

          }
   ),
    );
  }
}
