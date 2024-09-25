import 'package:care_cloud/controller/signup_crud.dart';
import 'package:care_cloud/model/username_and_password_db/userpassword_db.dart';
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/customTextfornField.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:care_cloud/view/login_screen/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  
  final SignupCrud _signupCrud = SignupCrud();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        title: const Text(
          'Sign Up',
          style: TextStyle(color: AppColors.title),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                    controller: _usernameController,
                    hintText: 'Enter your name',
                    icon: Icons.person_add_alt_1_outlined,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter Username';
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                    controller: _passwordController,
                    hintText: 'Enter a Password',
                    icon: Icons.lock_person_outlined,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter Password';
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm password',
                    icon: Icons.lock_person_outlined,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Re-enter password';
                      } else if (value != _passwordController.text) {
                        return "incorrect password";
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                    text: 'Sign Up',
                    width: 350,
                    onTap: ()async {
                      if (_formkey.currentState!.validate()) {
                        _signupCrud.addSignupData(UserPassDb(
                            username: _usernameController.text,
                            password: _passwordController.text));
                        final profSharedprefs = await SharedPreferences.getInstance();
                        await profSharedprefs.clear();
                        const snackBar = SnackBar(
                          content: Text('successfully signed in'),
                          duration: Duration(seconds: 5),
                          backgroundColor: Colors.green,
                        );
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.push(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      }
                    }),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                    text: TextSpan(
                        text: "Already have an account?",
                        style: const TextStyle(color: AppColors.title),
                        children: [
                      TextSpan(
                          text: ' Login',
                          style: const TextStyle(color: AppColors.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            })
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
