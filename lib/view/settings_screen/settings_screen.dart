import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:care_cloud/view/about_us_screen/about_us_screen.dart';
import 'package:care_cloud/view/edit_profile/edit_profile_main.dart';
import 'package:care_cloud/view/profile_page/sample_page.dart';
import 'package:care_cloud/view/selection_screen/selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:care_cloud/model/username_and_password_db/userpassword_db.dart';
import 'package:care_cloud/model/add_account_db/add_account_db.dart';
import 'package:care_cloud/model/vitals_db/vitals_db.dart';
import 'package:care_cloud/model/blood_glucose_db/blood_glucose_db.dart';
import 'package:care_cloud/model/doctor_appointment_db/doctor_appoitment_db.dart';
import 'package:care_cloud/model/user_records_db/user_record_db.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  Future<void> clearAllHiveBoxes(BuildContext context) async {
      await Future.wait([
        Hive.box<UserPassDb>('dataBox').clear(),
        Hive.box<ProfileDb>('profileBox').clear(),
        Hive.box<VitalsDb>('vitalsBox').clear(),
        Hive.box<BloodGlucoseDb>('bloodGlucoseBox').clear(),
        Hive.box<UserRecordDb>('userRecordBox').clear(),
        Hive.box<DoctorAppoitmentDb>('doctorAppointmentBox').clear(),
      ]);
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const SelectionScreen()),
        (Route<dynamic> route) => false,
      );
  }
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
        const FaIcon(FontAwesomeIcons.circleInfo, color: Colors.blue),
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AboutUsPage()));
        },
      ),
      Sample(
        "Delete Account",
        const FaIcon(FontAwesomeIcons.circleExclamation, color: Colors.red),
        () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete_forever, color: Colors.red),
                    SizedBox(width: 8),
                    Text(
                      "Delete Account",
                      style: TextStyle(color: AppColors.primary, fontSize: 20),
                    ),
                  ],
                ),
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Are you sure you want to delete your \n account?",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "*Effective immediately, all data associated\n  with the account will be deleted",
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
                actions: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          text: 'Cancel',
                          width: 100,
                          height: 45,
                          color: AppColors.subTitle,
                          textColor: AppColors.title,
                          borderRadius: 10,
                          borderColor: AppColors.subTitle,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const SizedBox(width: 30),
                        CustomButton(
                          text: 'Delete Account',
                          width: 150,
                          height: 45,
                          textColor: AppColors.secondary,
                          color: Colors.red,
                          borderRadius: 10,
                          borderColor: Colors.red,
                          onTap: () async {
                            await clearAllHiveBoxes(context);
                          },
                        )
                      ])
                ],
              );
            },
          );
        },
      ),
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