import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tenang_app/component/button.dart';
import 'package:tenang_app/component/textfield.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();

  var check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(children: [
        // header
        header(),

        const SizedBox(
          height: 35,
        ),

        MyTextField(
            controller: fullNameController,
            hintText: "full name",
            obscureText: false),
        const SizedBox(
          height: 15,
        ),
        MyTextField(
            controller: usernameController,
            hintText: "username",
            obscureText: false),
        const SizedBox(
          height: 15,
        ),
        MyTextField(
            controller: passwordController,
            hintText: "password",
            obscureText: true),

        const SizedBox(
          height: 15,
        ),

        Row(
          children: [
            Checkbox(
              value: check,
              onChanged: ((newvalue) => check = newvalue!),
            ),
            Container(
              width: 300,
              padding: EdgeInsets.all(5),
              child: const Text(
                "By creating an account you agree to our Terms of Service and Privacy Policy",
                overflow: TextOverflow.clip,
                softWrap: true,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),

        MyButton(onPressed: (() => print("signup")), text: "Sign up")
      ]),
    );
  }

  Row header() {
    return Row(
      children: [
        const BackButton(
          color: Color(0xFF4E4B66),
        ),
        const SizedBox(
          width: 100,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              "Sign up",
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Color(0xFF4E4B66),
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "create new account",
              textAlign: TextAlign.right,
              style: TextStyle(color: Color(0xFF8A8D9F), fontSize: 20),
            )
          ],
        )
      ],
    );
  }
}
