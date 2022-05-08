import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/apimodel.dart';

class HomeApiData extends StatefulWidget {
  const HomeApiData({Key? key}) : super(key: key);

  @override
  _HomeApiDataState createState() => _HomeApiDataState();
}

class _HomeApiDataState extends State<HomeApiData> {

  List<UserApiModel> userList = [] ;

  Future<List<UserApiModel>> getUserApi ()async{
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
      
        userList.add(UserApiModel.fromJson(i));
      }
      return userList;
    }else {
      return userList;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
    
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi() ,
              builder: (context ,AsyncSnapshot<List<UserApiModel>> snapshot){

                if(!snapshot.hasData){
                  return const CircularProgressIndicator();
                }else{
                  return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context , index){
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ReusableWidget(title: 'Name', value: snapshot.data![index].name.toString()),
                                ReusableWidget(title: 'username', value: snapshot.data![index].username.toString()),
                                ReusableWidget(title: 'email', value: snapshot.data![index].email.toString()),
                                ReusableWidget(title: 'Address',
                                    value: snapshot.data![index].address!.geo!.lat.toString()

                                )
                              ],
                            ),
                          ),
                        );
                      });
                }

              },
            ),
          )
        ],
      ),
    );
  }

}

class ReusableWidget extends StatelessWidget {
  String title , value ;
  ReusableWidget({Key? key , required this.title , required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value ),

        ],
      ),
    );
  }
}