import 'package:care_cloud/model/add_account_db/add_account_db.dart';
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/custom_snackbar.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:care_cloud/view/edit_profile/edit_profile_avatar.dart';
import 'package:care_cloud/view/edit_profile/gender_selection.dart';
import 'package:care_cloud/view/edit_profile/profile_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String _selectedGender = '';
  String? image;
  String? newImagePath;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<ProfileDb>('profileBox').listenable(),
      builder: (context, box, child) {
        var data = box.values.toList().cast<ProfileDb>();

        return Scaffold(
          backgroundColor: AppColors.secondary,
          appBar: AppBar(
            backgroundColor: AppColors.secondary,
            title: const Text('Edit Profile'),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
               
                children: [
                  EditProfileAvatar(
                    imagePath: newImagePath ?? data.last.image,
                    onCameraTap: cameraImage,
                    onGalleryTap: galleryImage,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),
                        const SizedBox(height: 25),
                        ProfileFormFields(
                          profile: data.last,
                          formKey: _formKey,
                          onSavedName: (value) => data.last.username = value,
                          onSavedPhone: (value) => data.last.phoneno = value,
                          onSavedAge: (value) => data.last.age = value,                         
                          onSavedAddress: (value) => data.last.address = value,
                          onSavedPincode: (value) => data.last.pincode = value,
                          onSavedCity: (value) => data.last.city = value,
                        ),
                          const SizedBox(height: 25),
                           
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text('Gender'),
                            ),
                          ),
                              const SizedBox(height: 10),
                        GenderSelection(
                          selectedGender: _selectedGender,
                          onGenderSelect: (gender) {
                            setState(() {
                              _selectedGender = gender;
                              data.last.gender = gender;
                            });
                          },
                        ),
                        const SizedBox(height: 50),
                        CustomButton(
                          text: 'Save Profile',
                          width: 350,
                          borderRadius: 10,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              data.last.image = newImagePath ?? data.last.image;
                              box.putAt(box.length - 1, data.last);
                               CustomSnackbar.show(
                  context: context, text: 'Your profile updated', backgroundColor: Colors.green);
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> cameraImage() async {
    final XFile? photo =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      newImagePath = photo?.path;
    });
  }

  Future<void> galleryImage() async {
    final XFile? photo =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      newImagePath = photo?.path;
    });
  }
}
