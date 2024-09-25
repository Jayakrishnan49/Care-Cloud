import 'package:care_cloud/model/add_account_db/add_account_db.dart';
import 'package:care_cloud/utilities/customTextfornField.dart';
import 'package:flutter/material.dart';

class ProfileFormFields extends StatelessWidget {
  final ProfileDb profile;
  final GlobalKey<FormState> formKey;
  final void Function(String) onSavedName;
  final void Function(String) onSavedPhone;
  final void Function(String) onSavedAge;
  final void Function(String) onSavedAddress;
  final void Function(String) onSavedPincode;
  final void Function(String) onSavedCity;

  const ProfileFormFields({
    super.key,
    required this.profile,
    required this.formKey,
    required this.onSavedName,
    required this.onSavedPhone,
    required this.onSavedAge,
    required this.onSavedAddress,
    required this.onSavedPincode,
    required this.onSavedCity,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            initialValue: profile.username,
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
            onSaved: (value) => onSavedName(value!),
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            initialValue: profile.phoneno,
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
            onSaved: (value) => onSavedPhone(value!),
          ),
          
          const SizedBox(height: 25),
          CustomTextFormField(
            initialValue: profile.age,
            keyboardType: TextInputType.number,
            hintText: 'Enter your age e.g., 25',
            labelText: 'Age',
            width: 150,
            borderRadius: 10,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter your age';
              } else {
                return null;
              }
            },
            onSaved: (value) => onSavedAge(value!),
          ),
          const SizedBox(height: 25),
          const Text(
                            'Your Address',
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(height: 25),
          CustomTextFormField(
            initialValue: profile.address,
            labelText: 'Address',
            hintText: 'Enter your address here',
            borderRadius: 10,
            height: 150,
            onSaved: (value) => onSavedAddress(value!),
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            initialValue: profile.pincode,
            keyboardType: TextInputType.number,
            labelText: 'Pincode',
            borderRadius: 10,
            onSaved: (value) => onSavedPincode(value!),
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            initialValue: profile.city,
            labelText: 'City',
            borderRadius: 10,
            onSaved: (value) => onSavedCity(value!),
          ),
        ],
      ),
    );
  }
}
