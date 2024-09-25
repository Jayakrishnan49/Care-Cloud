import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/view/profile_page/sample_page.dart';
import 'package:flutter/material.dart';


class SettingsList extends StatelessWidget {
  final List<Sample> tileItems;

  const SettingsList({required this.tileItems, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                shrinkWrap: true, // Prevents overflow when inside Column
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
            ),
            const Spacer(), // Pushes the footer to the bottom
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Column(
                children: [
                  Container(
              
              width: 80,// Set the desired width
              height: 80, // Set the desired height
              decoration: BoxDecoration(
                // color: AppColors.primary,
                image: DecorationImage(
                  image: AssetImage('assets/app_logo/Care Cloud Logo.png'), // Replace with your app's logo
                  fit: BoxFit.fill, // Adjusts the image to fill the container
                ),
                // borderRadius: BorderRadius.circular(10), // Optional: Rounded corners
              ),
            ),
                  Text(
                    "Version 1.0.0",
                    style: TextStyle(color: AppColors.subTitle),
                  ),
                  // SizedBox(height: 5),
                  // Text(
                  //   "© 2024 Care Cloud. All Rights Reserved.",
                  //   style: TextStyle(color: AppColors.subTitle),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
