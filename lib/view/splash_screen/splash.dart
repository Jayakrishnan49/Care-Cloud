import 'package:care_cloud/main.dart';
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/view/homepage_screen/homepage_screen.dart';
import 'package:care_cloud/view/selection_screen/selection_screen.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 4));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const SelectionScreen()));
  }

  Future<void> checkUserLoggedIn() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprefs.getBool(saveKey);
    final profSharedprefs = await SharedPreferences.getInstance();
    final savedProfileCheck = profSharedprefs.getBool(profSavekey);
    if ((userLoggedIn == null || userLoggedIn == false) &&
        (savedProfileCheck == null || savedProfileCheck == false)) {
      navigateToHome();
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const HomepageScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Center(
          child: SizedBox(
            height: 200,
            width: 200,
            child:
                Image.asset('assets/app_logo/Care Cloud Logo 2.png'),
          ),
        ),
      ),
    );
  }
}
