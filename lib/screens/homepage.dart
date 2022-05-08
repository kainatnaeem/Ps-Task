import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pstask/api/apiscreen.dart';


import '../models/user.dart';
import '../services/authservices.dart';

UserData? userData;
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   
  @override
  Widget build(BuildContext context) {
    final auth= Provider.of<AuthService>(context,listen: false);
    return Scaffold(
      appBar: AppBar( title: const Text("Welcome"),
      actions: [IconButton(onPressed: (){auth.signOut();}, icon: const Icon(Icons.logout))],
      ),
      body: const HomeApiData() ,
 
     
    );
  }
}