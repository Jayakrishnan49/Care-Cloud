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
                shrinkWrap: true, 
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
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                children: [
                  Container(
              
              width: 80,
              height: 80, 
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/app_logo/Care Cloud Logo.png'), 
                  fit: BoxFit.fill,
                ),
              ),
            ),
                  const Text(
                    "Version 1.0.0",
                    style: TextStyle(color: AppColors.subTitle),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
