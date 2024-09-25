import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/view/about_us_screen/about_us_screen.dart';
import 'package:care_cloud/view/edit_profile/edit_profile_main.dart';
import 'package:care_cloud/view/profile_page/sample_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Sample> tileItems = [
      Sample(
        "Edit Profile",
        const FaIcon(FontAwesomeIcons.userPen),
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EditProfileScreen()));
        },
      ),
      Sample(
        "About Us",
        const FaIcon(FontAwesomeIcons.circleInfo,color: Colors.blue,),
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AboutUsPage()));
        },
      ),
      // Sample(
      //   "Delete Account",
      //   const FaIcon(
      //     FontAwesomeIcons.circleExclamation,
      //     color: Colors.red,
      //   ),
      //   () {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => const SettingsScreen()));
      //   },
      // ),
    ];
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        title: const Text('Settings'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: tileItems[index].onTap,
            child: ListTile(
              leading: tileItems[index].icons,
              title: Text(
                tileItems[index].name!,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        },
        itemCount: tileItems.length,
      ),
    );
  }
}

