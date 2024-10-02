import 'package:care_cloud/controller/login_fn.dart';
import 'package:care_cloud/main.dart';
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/customTextfornField.dart';
import 'package:care_cloud/utilities/custom_snackbar.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:care_cloud/view/add_account/add_account_main.dart';
import 'package:care_cloud/view/homepage_screen/homepage_screen.dart';
import 'package:care_cloud/view/signup_screen/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    LoginFn loginFn = LoginFn();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final formkeyLogIn = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: AppColors.title),
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          child: Form(
            key: formkeyLogIn,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                    controller: usernameController,
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
                    controller: passwordController,
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
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  text: 'Login',
                  width: 350,
                  onTap: () async {
                    //
                    if (formkeyLogIn.currentState!.validate()) {
                      final bool login = await loginFn.isLogin(
                          userName: usernameController.text,
                          passWord: passwordController.text);
                      if (login) {
                        final sharedprefs =
                            await SharedPreferences.getInstance();
                        await sharedprefs.setBool('key', true);
                        final profSharedprefs =
                            await SharedPreferences.getInstance();
                        final savedProfileCheck =
                            profSharedprefs.getBool(profSavekey);
                        if ((savedProfileCheck == null ||
                            savedProfileCheck == false)) {
                          Navigator.push(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddAccount()));
                        } else {
                          Navigator.pushAndRemoveUntil(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomepageScreen()),
                            (Route<dynamic> route) => false,
                          );
                        }
                      } else {
                        // ignore: use_build_context_synchronously
                        CustomSnackbar.show(context: context, text: 'Incorrect Username or Password', backgroundColor: Colors.red);
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                    text: TextSpan(
                        text: "Don't have an account?",
                        style: const TextStyle(color: AppColors.title),
                        children: [
                      TextSpan(
                          text: ' Sign Up',
                          style: const TextStyle(color: AppColors.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen()));
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
