// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController fullName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  bool visibility = true;
  @override
  Widget build(BuildContext context) {
    SignupAuthProvider2 signupAuthProvider =
        Provider.of<SignupAuthProvider2>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/login.png'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    TextFormField(
                      controller: fullName,
                      decoration: InputDecoration(
                        hintText: "Full name",
                      ),
                    ),
                    TextFormField(
                      controller: emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email address",
                      ),
                    ),
                    TextFormField(
                      obscureText: visibility,
                      controller: password,
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              visibility = !visibility;
                            });
                          },
                          icon: Icon(
                            visibility
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    signupAuthProvider.loading == false
                        ? MyButton(
                            onPressed: () {
                              signupAuthProvider.signupVaidation(
                                fullName: fullName,
                                context: context,
                                emailAdress: emailAddress,
                                password: password,
                              );
                            },
                            text: "SIGN UP",
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?\t\t"),
                        GestureDetector(
                          onTap: () {
                            RoutingPage.goTonext(
                              context: context,
                              navigateTo: LoginPage(),
                            );
                          },
                          child: Text("LOGIN"),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
