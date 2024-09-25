import 'package:care_cloud/model/add_account_db/add_account_db.dart';
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/view/appointment_screen/add_appointment_screen.dart';
import 'package:care_cloud/view/blood_glucose_screen/blood_glucose_screen.dart';
import 'package:care_cloud/view/bmi_calculator_screen/bmi_calculator.dart';
import 'package:care_cloud/view/homepage_screen/homepage_widget/bottom_navigationbar_widget.dart';
import 'package:care_cloud/view/homepage_screen/homepage_widget/carosel_widget.dart';
import 'package:care_cloud/view/homepage_screen/homepage_widget/health_manager_widget.dart';
import 'package:care_cloud/view/my_vitals_page/main_vital_page.dart';
import 'package:care_cloud/view/profile_page/profile_main_page.dart';
import 'package:care_cloud/view/records_screen/add_and_listing_records_screen.dart';
import 'package:care_cloud/view/todays_appointment_screen/todays_appointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});
  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}
class _HomepageScreenState extends State<HomepageScreen> {
  int selectedIndex = 0;
  List<Widget> navigationItems = [
    const FaIcon(
      FontAwesomeIcons.house,
      color: AppColors.secondary,
    ),
    const FaIcon(
      FontAwesomeIcons.fileMedical,
      color: AppColors.secondary,
    ),
    const FaIcon(
      FontAwesomeIcons.userDoctor,
      color: AppColors.secondary,
    ),
    const FaIcon(
      FontAwesomeIcons.user,
      color: AppColors.secondary,
    ),
  ];
  List<Widget> screens = [
    const MyHomeScreen(),
    const AddAndListingRecordsScreen(),
    const AddAppointmentScreen(),
    const ProfileScreen(),
  ];
  List<String> healthManagerTexts = [
      'Blood\nGlucose',
      'BMI\nCalculator',
      'My\nVitals',
      "Today's\nAppointment",
    ];
    List<String> healthManagerImages = [
      'assets/home_icon_images/blood_glucose-removebg.png',
      'assets/home_icon_images/bmi_calculator-removebg-preview.png',
      'assets/home_icon_images/my_vitals.png',
      'assets/home_icon_images/todays_appointment-removebg-preview.png',
    ];
    List<Widget> healthManagerScreens = [
      const BloodGlucoseScreen(),
      const BmiCalculator(),
      const NewMyVitals(),
      const TodaysAppointmentScreen(),
    ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<ProfileDb>('profileBox').listenable(),
        builder: (context, box, child) {
          var data = box.values.toList().cast<ProfileDb>();
          return Scaffold(
            backgroundColor: AppColors.secondary,
            appBar: selectedIndex == 3
                ? null
                : AppBar(
                    backgroundColor: AppColors.secondary,
                    title: Text(
                      data.last.username,
                      style: const TextStyle(color: AppColors.title),
                    ),
                    automaticallyImplyLeading: false,
                  ),
            bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
            body: screens[selectedIndex],
          );
        });
  }
}
class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> carouselImages = [
      'assets/carosel_images/upload records image.png',
      'assets/carosel_images/BMI image.png',
      'assets/carosel_images/appointment image.png',
    ];
    List<Widget> screens = [
      const AddAndListingRecordsScreen(),
      const BmiCalculator(),
      const AddAppointmentScreen(),
    ];
    List<String> healthManagerTexts = [
      'Blood\nGlucose',
      'BMI\nCalculator',
      'My\nVitals',
      "Today's\nAppointment",
    ];
    List<String> healthManagerImages = [
      'assets/home_icon_images/blood_glucose-removebg.png',
      'assets/home_icon_images/bmi_calculator-removebg-preview.png',
      'assets/home_icon_images/my_vitals.png',
      'assets/home_icon_images/todays_appointment-removebg-preview.png',
    ];
    List<Widget> healthManagerScreens = [
      const BloodGlucoseScreen(),
      const BmiCalculator(),
      const NewMyVitals(),
      const TodaysAppointmentScreen(),
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCarousel(
              images: carouselImages,
              screens: screens,
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HealthManagerSection(
              texts: healthManagerTexts,
              images: healthManagerImages,
              screens: healthManagerScreens,
            ),
                  ],
                ),  
            const SizedBox(
              height: 20,
            ),
          ]
            )
          ],
        ),
      ),
    );
  }
}
