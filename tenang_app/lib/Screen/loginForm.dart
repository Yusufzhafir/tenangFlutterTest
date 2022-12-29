import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tenang_app/Screen/signupForm.dart';
import 'package:tenang_app/component/button.dart';
import 'package:tenang_app/component/textfield.dart';
import 'package:tenang_app/component/tile.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              Image.asset(
                'img/aleshaLogo.png',
                width: 160,
                height: 184,
              ),

              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Welcome back!',
                style: TextStyle(
                    color: const Color(0xFF4E4B66).withOpacity(1),
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'sign in to continue.',
                style: TextStyle(
                    color: const Color(0xFF8A8D9F).withOpacity(1),
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: const Color(0xFF4A80FF).withOpacity(1)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                onPressed: signUserIn,
                text: "Sign in",
              ),

              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  SquareTile(imagePath: 'img/google.png'),

                  SizedBox(width: 25),

                  // apple button
                  SquareTile(imagePath: 'img/apple.png'),

                  SizedBox(width: 25),

                  // facebook button
                  SquareTile(imagePath: 'img/icon_facebook.png')
                ],
              ),

              const SizedBox(height: 50),

              // dont have account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Do not have an account?',
                    style: TextStyle(color: Color(0xFF4E4B66)),
                  ),
                  const SizedBox(width: 4),

                  //rich text button
                  RichText(
                    text: TextSpan(
                      text: "Sign up!",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: ((context) => SignUp()))),
                      style: const TextStyle(
                        color: Color(0xFF4A80FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
