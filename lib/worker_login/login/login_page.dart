// ignore_for_file: prefer_const_constructors

import 'package:canteen_app/login/components/center_part.dart';
import 'package:canteen_app/login/components/end_part.dart';
import 'package:canteen_app/login/components/login_auth_provider.dart';
import 'package:canteen_app/login/components/top_part.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    LoginAuthProvider2 loginAuthProvider =
        Provider.of<LoginAuthProvider2>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/register.png'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // top part/
              TopPart2(),
              // center part
              CenterPart2(
                email: email,
                password: password,
                obscureText: visible,
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                icon: Icon(
                  visible ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              //end part
              EndPart2(
                loading: loginAuthProvider.loading,
                onPressed: () {
                  loginAuthProvider.loginPageVaidation(
                    emailAdress: email,
                    password: password,
                    context: context,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
