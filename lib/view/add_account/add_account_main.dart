import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/view/add_account/account_form.dart';
import 'package:care_cloud/view/add_account/profile_picture_picker.dart';
import 'package:flutter/material.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({super.key});

  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  String? image; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Complete Your Profile',
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                'Add your details',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ProfilePicturePicker(
                image: image, 
                onImagePicked: (imagePath) {
                  setState(() {
                    image = imagePath; 
                  });
                },
              ),
              const SizedBox(height: 30),
              AccountForm(image: image),
            ],
          ),
        ),
      ),
    );
  }
}
