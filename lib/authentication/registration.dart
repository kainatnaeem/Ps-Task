
import 'package:flutter/material.dart';
import 'package:pstask/authentication/signin.dart';
import 'package:pstask/models/user.dart';
import 'package:pstask/screens/homepage.dart';
import 'package:pstask/services/authservices.dart';

import '../Responsive/layoutbuilder_helper.dart';
import '../widgets/button.dart';
import '../widgets/loading.dart';
import '../widgets/textformfield.dart';

UserData? userData;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? password;
  String? email;
  String? name;
 
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
 
  Widget _buildName() {
    return TextFormFieldWidget(
      hintText: "Name",
      obscureText: false,
      textInputType: TextInputType.text,
      actionKeyboard: TextInputAction.done,
      validator: (val){
    if (val == null) {
          return ' Name is required';
        }

        if (val.length < 5 || val.length > 12) {
          return ' Name must be betweem 5 and 12 characters';
        }

        return null;
     
      },
      onChanged: (val) {
        setState(() => name = val);
      },
      field: name,
      prefixIcon: Icon(Icons.person),
      defaultText: '',
    );
  }

  Widget _buildEmail() {
    return TextFormFieldWidget(
      hintText: "Email",
      obscureText: false,
      textInputType: TextInputType.emailAddress,
      actionKeyboard: TextInputAction.done,
      validator: (val){ if (val == null) {
          return 'Email is required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(val)) {
          return 'Please enter a valid email address';
        }

        return null;
      },
      onChanged: (val) {
        setState(() => email = val);
      },
      field: email,
      prefixIcon: Icon(Icons.email),
      defaultText: '',
    );
  }

  Widget _buildPassword() {
    return TextFormFieldWidget(
      hintText: "Password",
      obscureText: true,
      textInputType: TextInputType.visiblePassword,
      actionKeyboard: TextInputAction.done,
      validator: (val){   if (val==null) {
          return 'Password is required';
        }

        if (val.length < 5 || val.length > 20) {
          return 'Password must be betweem 5 and 20 characters';
        }

        return null;
      },
      onChanged: (val) {
        setState(() => password = val);
      },
      field: password,
      prefixIcon: Icon(Icons.keyboard_hide),
      defaultText: '',
    );
  }


  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
 
    return loading
        ? Loading()
        : Scaffold(
            key: _scaffoldKey,
           
            body: SingleChildScrollView(
              child: SafeArea(
                child: Responsive(
            
            mobile: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 45.0),
                   const Text(
                        'REGISTER',
                        style:
                            TextStyle(fontSize:25.0, color:Colors.blue ,fontWeight: FontWeight.bold),
                      ),
                            Text(
                        'Create your new account',
                        style:
                            TextStyle(fontSize:15.0, color: Colors.black54),
                      ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                     const SizedBox(height: 10.0),
                     
              
                    
              _buildName(),
              const SizedBox(height: 10.0),
              _buildEmail(),
              const SizedBox(height: 10.0),
              _buildPassword(),
                     const SizedBox(height: 10.0),
         
              SizedBox(
                height: 20.0,
              ),
              CustomButton(
                  buttonText: 'sign up',
                  textColor: Colors.white,
                  borderRadius: 10,
                  buttonColor: Colors.blue,
                  borderColor: Colors.white,
                  onClick: () async {
                                await _submit();
                              }
                  ), SizedBox(
                height: 2.0,
              ),
                GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()));
                              },
                   child:  Text.rich(
                              TextSpan(
                                  text: 'Already have an account?',
                                  children: [
                                    TextSpan(
                                      text: 'Login',
                                      style: TextStyle(
                                        color: Colors.blue.shade900,
                                      ),
                                    ),
                                  ]),),
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
              tab: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                       const SizedBox(height: 35.0),
                     Text(
                        'REGISTER',
                        style:
                            TextStyle(fontSize:25.0, color: Colors.blue,fontWeight: FontWeight.bold),
                      ),
                            Text(
                        'Create your new account',
                        style:
                            TextStyle(fontSize:15.0, color: Colors.black54),
                      ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                       const SizedBox(height: 10.0),
                       
                        
                          _buildName(),
                          const SizedBox(height: 10.0),
                          _buildEmail(),
                          const SizedBox(height: 10.0),
                          _buildPassword(),
                      
                       
                          CustomButton(
                              buttonText: 'sign up',
                              textColor: Colors.white,
                              borderRadius: 10,
                              buttonColor: Colors.blue,
                              borderColor: Colors.white,
                              onClick: () async {
                                await _submit();
                              }
                              
                              ),
                      SizedBox(
                height:5.0,
              ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()));
                              },
                   child:  Text.rich(
                              TextSpan(
                                  text: 'Already have an account?',
                                  children: [
                                    TextSpan(
                                      text: 'Login',
                                      style: TextStyle(
                                        color: Colors.blue.shade900,
                                      ),
                                    ),
                                  ]),),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
                ),
              ),
            ),
          );
  }

  Future<void> _submit() async {
     if (_formKey.currentState!
        .validate()) {
      setState(() => loading = true);
      dynamic result = await _auth
          .createUserWithEmailAndPassword(
              email!,
              password!,
              name!,
             );
      if (result == null) {
        setState(() {
          loading =false;
        });
      
      }
      else{
               Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) =>Home()));
      }
    }
  }
}
