
import 'package:flutter/material.dart';
import 'package:pstask/authentication/registration.dart';
import 'package:pstask/screens/homepage.dart';
import 'package:pstask/services/authservices.dart';

import '../Responsive/layoutbuilder_helper.dart';
import '../widgets/button.dart';
import '../widgets/loading.dart';
import '../widgets/textformfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  bool _isRembemerMe = false;

  // text field state
  String email = '';
  String password = '';
  Widget _buildPassword() {
    return TextFormFieldWidget(
      hintText: "Password",
      obscureText: true,
      textInputType: TextInputType.visiblePassword,
      actionKeyboard: TextInputAction.done,
      validator: (val) => val!.length < 4 || val.isEmpty ? 'Too short' : null,
      onChanged: (val) {
        setState(() => password = val);
      },
      field: password,
      prefixIcon: Icon(Icons.keyboard_hide),
      defaultText: '',
    );
  }

  Widget _buildEmail() {
    return TextFormFieldWidget(
      hintText: "Email",
      obscureText: false,
      textInputType: TextInputType.emailAddress,
      actionKeyboard: TextInputAction.done,
      validator: (val) => val!.length < 4 || val.isEmpty ? 'Too short' : null,
      onChanged: (val) {
        setState(() => email = val);
      },
      field: email,
      prefixIcon: Icon(Icons.email),
      defaultText: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return loading
        ? Loading()
        : Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Responsive(
                 mobile: Container(
                     padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.07,
                        ),
                        SizedBox(
                          height: height * 0.4,
                          width: width * 0.9,
                          child:Image.asset(
                    'images/love.jpg',
                            ),
                      
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 20.0),
                              _buildEmail(),
                              const SizedBox(height: 10.0),
                              _buildPassword(),
                              const SizedBox(height: 3.0),
                              Row(
                                children: [
                                  Checkbox(
                                    activeColor: Colors.lightBlue,
                                    checkColor: Colors.white,
                                    value: _isRembemerMe,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isRembemerMe = value!;
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Remember me ',
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.black),
                                  ), //Text
                                  const SizedBox(width: 100),
                                  const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ), //Text
                                ],
                              ),
                              SizedBox(
                                height: 60.0,
                              ),
                              CustomButton(
                                  buttonText: 'Login',
                                  textColor: Colors.white,
                                  borderRadius: 10,
                                  buttonColor: Colors.blue,
                                  borderColor: Colors.white,
                                 onClick: () async {
                                      await _submit(context);
                                    }),
                                  
                           
                              SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                                child: Text.rich(
                                  TextSpan(
                                      text: 'Don\'t have an account',
                                      children: [
                                        TextSpan(
                                          text: 'Signup',
                                          style: TextStyle(
                                            color: Colors.blue.shade900,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ), tab:  Container(
                     padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.07,
                          ),
                          SizedBox(
                            height: height * 0.4,
                            width: width * 0.9,
                            child:Image.asset(
                      'images/love.jpg',
                              ),
                        
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                const SizedBox(height: 20.0),
                                _buildEmail(),
                                const SizedBox(height: 10.0),
                                _buildPassword(),
                                const SizedBox(height: 3.0),
                                Row(
                                  children: [
                                    Checkbox(
                                      activeColor: Colors.lightBlue,
                                      checkColor: Colors.white,
                                      value: _isRembemerMe,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _isRembemerMe = value!;
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Remember me ',
                                      style: TextStyle(
                                          fontSize: 10.0, color: Colors.black),
                                    ), //Text
                                    const SizedBox(width: 190),
                                    const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ), //Text
                                  ],
                                ),
                            
                                CustomButton(
                                    buttonText: 'Login',
                                    textColor: Colors.white,
                                    borderRadius: 10,
                                    buttonColor: Colors.blue,
                                    borderColor: Colors.white,
                                    onClick: () async {
                                      await _submit(context);
                                    }),
                                SizedBox(
                                  height: 10.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Register()));
                                  },
                                  child: Text.rich(
                                    TextSpan(
                                        text: 'Don\'t have an account',
                                        children: [
                                          TextSpan(
                                            text: 'Signup',
                                            style: TextStyle(
                                              color: Colors.blue.shade900,
                                            ),
                                          ),
                                        ]),
                                  ),
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
            ),
          );
  }

  Future<void> _submit(BuildContext context) async {
      if (_formKey.currentState!.validate()) {
      setState(() => loading = true);
      dynamic result =
    
          await _auth.signInWithEmailAndPassword(
              email, password);
      if (result == null) {
        setState(() {
          loading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(
            SnackBar(
              content: Text(
                  "User does not exist try another Email or Password"),
              duration:
                  Duration(milliseconds: 1000),
            ),
          );
        });
      }
      else{
               Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
      }
    }
  }
}
