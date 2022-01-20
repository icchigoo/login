// ignore_for_file: prefer_const_constructors

import 'package:canteen_app/login/signup/signup_page.dart';
import 'package:canteen_app/login/widgets/my_button.dart';
import 'package:canteen_app/route/routing_page.dart';
import 'package:flutter/material.dart';

class EndPart2 extends StatelessWidget {
  final void Function()? onPressed;
  final bool loading;
  const EndPart2({
    required this.loading,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        loading == true
            ? CircularProgressIndicator()
            : MyButton(
                onPressed: onPressed,
                text: "LOG IN",
              ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?\t\t"),
            GestureDetector(
              onTap: () {
                RoutingPage.goTonext(
                  context: context,
                  navigateTo: SignupPage(),
                );
              },
              child: Text("SIGN UP"),
            ),
          ],
        )
      ],
    );
  }
}
