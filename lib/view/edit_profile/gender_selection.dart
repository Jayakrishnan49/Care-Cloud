import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:flutter/material.dart';
class GenderSelection extends StatelessWidget {
  final String selectedGender;
  final Function(String) onGenderSelect;

  const GenderSelection({
    super.key,
    required this.selectedGender,
    required this.onGenderSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButton(
          text: 'Male',
          color: selectedGender == 'Male' ? AppColors.primary : Colors.white,
          textColor: selectedGender == 'Male' ? Colors.white : Colors.black,
          width: 100,
          icon: const Icon(Icons.male),
          borderRadius: 10,
          onTap: () => onGenderSelect('Male'),
        ),
        CustomButton(
          text: 'Female',
          color: selectedGender == 'Female' ? AppColors.primary : Colors.white,
          textColor: selectedGender == 'Female' ? Colors.white : Colors.black,
          width: 115,
          icon: const Icon(Icons.female),
          borderRadius: 10,
          onTap: () => onGenderSelect('Female'),
        ),
        CustomButton(
          text: 'Others',
          color: selectedGender == 'Others' ? AppColors.primary : Colors.white,
          textColor: selectedGender == 'Others' ? Colors.white : Colors.black,
          width: 100,
          borderRadius: 10,
          onTap: () => onGenderSelect('Others'),
        ),
      ],
    );
  }
}
