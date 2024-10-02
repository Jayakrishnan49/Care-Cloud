import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:care_cloud/view/login_screen/login_screen.dart';
import 'package:care_cloud/view/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';



class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
          child: Center(
        child: SizedBox(
          // color: Colors.amber,
          height: 800,
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 200,
                child: Image.asset(
                    'assets/app_logo/Care Cloud Logo 1 new.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Let's get started!",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Login to enjoy the features we've\nprovided, and stay healthy!",
                style: TextStyle(
                  color: AppColors.subTitle,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 65,
              ),
              CustomButton(
                text: 'Login',
                height: 60,
                width: 270,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
              ),
              const SizedBox(
                height: 18,
              ),
              CustomButton(
                text: 'Sign Up',
                height: 60,
                width: 270,
                color: AppColors.secondary,
                textColor: AppColors.primary,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()));
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
