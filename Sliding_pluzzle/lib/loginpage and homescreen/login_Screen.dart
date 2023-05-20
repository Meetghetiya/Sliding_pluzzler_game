import 'package:flutter/material.dart';
import 'package:my_database/loginpage%20and%20homescreen/signin_screen.dart';
import 'package:my_database/loginpage%20and%20homescreen/widgets/gradient_button.dart';
import 'package:my_database/loginpage%20and%20homescreen/widgets/login_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Image.asset('assets/images/signin_balls.png'),
              SizedBox(
                height: 90,
              ),
              const Text(
                'Login.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 15),

              const SizedBox(height: 15),
              const LoginField(hintText: 'Email'),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Password'),
              const SizedBox(height: 20),
              GradientButton(
                label: 'Login',
              ),
              SizedBox(
                height: 40,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "If you have no account, \n then create new account !",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return SigninScreen();
                        },
                      ));
                    },
                    child: Text(
                      "Sign up",
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
