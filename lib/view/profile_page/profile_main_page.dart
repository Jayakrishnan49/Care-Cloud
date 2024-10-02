import 'package:care_cloud/model/add_account_db/add_account_db.dart';
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/custom_show_dialog.dart';
import 'package:care_cloud/view/login_screen/login_screen.dart';
import 'package:care_cloud/view/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:care_cloud/view/profile_page/profile_avatar.dart';
import 'package:care_cloud/view/profile_page/sample_page.dart';
import 'package:care_cloud/view/profile_page/setting_list.dart';
import 'package:care_cloud/view/profile_page/user_info.dart';
import 'package:care_cloud/view/settings_screen/settings_screen.dart';
import 'package:care_cloud/view/terms_and_condition_screen/terms_and_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> { 
  void _showDialog() {

    showDialog(
      context: context,
      builder: (context) {
        return    CustomShowDialog(
      title: 'Logout',
      subTitle: 'Are you sure you want to logout?',
      icon: const Icon(Icons.logout,color: Colors.red,),
      buttonLeft: 'No',
      buttonRight: 'Yes',
      onTap: () async {
        final sharedprefs = await SharedPreferences.getInstance();
        await sharedprefs.setBool('key', false);
        Navigator.pushAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (Route<dynamic> route) => false,
        );
      },
    );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Sample> tileItems = [
      Sample("Settings", const FaIcon(FontAwesomeIcons.gear), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SettingsScreen()));
      }),
      Sample("Privacy Policy", const FaIcon(FontAwesomeIcons.fileCircleCheck),
          () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  PrivacyPolicyScreen()));
      }),
      Sample("Terms & Conditions", const FaIcon(FontAwesomeIcons.penNib), () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  TermsAndConditionsScreen()));
      }),
      Sample(
          "Logout",
          const FaIcon(FontAwesomeIcons.arrowRightFromBracket,
              color: Colors.red), () {
        _showDialog();
      }),
    ];

    return ValueListenableBuilder(
      valueListenable: Hive.box<ProfileDb>('profileBox').listenable(),
      builder: (context, box, child) {
        var data = box.values.toList().cast<ProfileDb>();
        return Scaffold(
          backgroundColor: AppColors.primary,
          body: Center(
            child: SafeArea(
              child: Column(
                children: [
                  ProfileAvatar(imagePath: data.last.image??'123'),
                  UserInfo(
                    username: data.last.username,
                    gender: data.last.gender,
                    age: data.last.age,
                  ),
                  SettingsList(tileItems: tileItems),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}