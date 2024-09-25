import 'package:care_cloud/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomTime extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onPressed;
  final String? title;
  final IconData? prefixIcon;
  final String? hintText;
  final IconData? iconButton;
  // final FormFieldValidator<String>? validator;

  const CustomTime({
    super.key,
    required this.controller,
    this.onPressed,
    this.title,
    this.prefixIcon,
    this.hintText,
    this.iconButton,
    // this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Time*'),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          // autofocus: false,

          readOnly: true,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FaIcon(
                prefixIcon,
                color: AppColors.subTitle,
              ),
            ),
            suffixIcon: IconButton(
                onPressed: onPressed,
                icon: FaIcon(
                  iconButton,
                )),
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.subTitle),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
          ),
        ),
      ],
    );
  }
}
