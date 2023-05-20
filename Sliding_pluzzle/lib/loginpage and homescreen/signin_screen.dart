import 'package:flutter/material.dart';
import 'package:my_database/loginpage%20and%20homescreen/login_Screen.dart';
import 'package:my_database/loginpage%20and%20homescreen/widgets/gradient_button.dart';
import 'package:my_database/loginpage%20and%20homescreen/widgets/login_field.dart';
import 'package:my_database/loginpage%20and%20homescreen/widgets/social_button.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Image.asset('assets/images/signin_balls.png'),
              SizedBox(
                height: 50,
              ),
              const Text(
                'Sign up.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 40),
              const SocialButton(
                  iconPath: 'assets/svgs/g_logo.svg',
                  label: 'Continue with Google'),
              const SizedBox(height: 20),
              const SocialButton(
                iconPath: 'assets/svgs/f_logo.svg',
                label: 'Continue with Facebook',
                horizontalPadding: 90,
              ),
              const SizedBox(height: 15),
              const Text(
                'or',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Email'),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Password'),
              const SizedBox(height: 20),
              GradientButton(
                label: "Sign up",
              ),
              SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 70),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue),
                    ),
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
