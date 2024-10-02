import 'package:care_cloud/controller/profile_fn.dart';
import 'package:care_cloud/model/add_account_db/add_account_db.dart';
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/customTextfornField.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:care_cloud/view/homepage_screen/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountForm extends StatefulWidget {
  final String? image;

  const AccountForm({super.key, required this.image});

  @override
  State<AccountForm> createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  final ProfileDetails _profileDetails = ProfileDetails();
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phnoController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  String _selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              controller: _usernameController,
              labelText: 'Your Name',
              hintText: 'Enter your name',
              borderRadius: 10,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Enter name';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: _phnoController,
              keyboardType: TextInputType.number,
              labelText: 'Phone Number',
              hintText: 'Enter your phone number',
              borderRadius: 10,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Enter phone number';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 20),
            _genderSelection(),
            const SizedBox(height: 25),
            CustomTextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              labelText: 'Age',
              hintText: 'Enter your age e.g., 25',
              width: 150,
              borderRadius: 10,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Enter your age';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 25),
            CustomTextFormField(
              controller: _addressController,
              labelText: 'Address',
              hintText: 'Enter your address here',
              borderRadius: 10,
              height: 150,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: _pincodeController,
              keyboardType: TextInputType.number,
              labelText: 'Pincode',
              borderRadius: 10,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: _cityController,
              labelText: 'City',
              borderRadius: 10,
            ),
            const SizedBox(height: 50),
            CustomButton(
              text: 'Save',
              width: 350,
              borderRadius: 10,
              onTap: _saveProfile,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _genderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text('Gender'),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildGenderButton('Male', Icons.male),
            _buildGenderButton('Female', Icons.female),
            _buildGenderButton('Others', Icons.transgender),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderButton(String gender, IconData icon) {
    return CustomButton(
      text: gender,
      color: _selectedGender == gender ? AppColors.primary : Colors.white,
      textColor: _selectedGender == gender ? Colors.white : Colors.black,
      width: 100,
      icon: Icon(icon),
      borderRadius: 10,
      onTap: () {
        setState(() {
          _selectedGender = gender;
        });
      },
    );
  }

  void _saveProfile() async {
    if (_formkey.currentState!.validate()) {
      if (widget.image == null || widget.image!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Please add a profile picture"),
          ),
        );
        return;
      }
      if (_selectedGender.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Please select a gender"),
          ),
        );
        return;
      }
      _profileDetails.addProfileDetails(ProfileDb(
        username: _usernameController.text,
        phoneno: _phnoController.text,
        gender: _selectedGender,
        age: _ageController.text,
        address: _addressController.text,
        pincode: _pincodeController.text,
        city: _cityController.text,
        image: widget.image!,
      ));
      final profSharedprefs = await SharedPreferences.getInstance();
      await profSharedprefs.setBool('profKey', true);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomepageScreen()),
      );
    }
  }
}
