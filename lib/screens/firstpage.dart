
import 'package:flutter/material.dart';

import '../../authentication/signin.dart';
import '../Responsive/layoutbuilder_helper.dart';
import '../authentication/registration.dart';
import '../widgets/button.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Responsive(
          mobile:Column(
          children: [
            SizedBox(
              height: height * 0.16,
            ),
             Expanded(child: buildCard()), SizedBox(
              height: 15,
            ),
            buildSigninButton(context),
            SizedBox(
              height: 15,
            ),
            buildSignupButton(context),
            SizedBox(
              height: height * 0.02,
            ),
            buildIntroSloganText(),
            SizedBox(
              height: height * 0.07,
            ),
           
          ], ),
        
         tab: Column(
          children: [
            SizedBox(
              height: height * 0.07,
            ),
          Expanded(child: buildCard()), SizedBox(
              height: 15,
            ),
                buildSigninButton(context),
               SizedBox(
                  height: height * 0.02,
                ),
                buildSignupButton(context),
                SizedBox(
                  height: height * 0.02,
                ),
            
            buildIntroSloganText(),
            SizedBox(
              height: height * 0.02,
            ),
          
          ], ),),
      
      ),
    );
  }

 Image buildCard() {
    return Image.asset(
      
            'images/love.jpg',
          );
  }

 Padding buildIntroSloganText() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
            'Save Live Of Others,',
           textAlign:TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,),
          ),
    );
  }

  CustomButton buildSignupButton(BuildContext context) {
    return CustomButton(
          onClick: () {
         Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
          },
          buttonText: 'Sign up',
          textColor: Colors.white,

          borderRadius: 10,
          buttonColor: Colors.red,
          borderColor: Colors.white,

        );
  }

  CustomButton buildSigninButton(BuildContext context) {
    return CustomButton(
          onClick: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          },
          buttonText: 'Sign in',
          textColor: Colors.white,
          borderRadius: 10,
          buttonColor: Colors.black,
          borderColor: Colors.white,
        );
  }
}
