import 'package:care_cloud/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomDateSmall extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPressed;
  final String? title;
  final IconData? prefixIcon;
  final String? hintText;
  final IconData? iconButton;

  const CustomDateSmall(
      {super.key,
      required this.controller,
      required this.onPressed,
      this.title,
      this.prefixIcon,
      this.hintText,
      this.iconButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Date*'),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 150,
          child: TextFormField(
            readOnly: true,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              // prefixIcon: Padding(
              //   padding: const EdgeInsets.only(top: 9,left: 9),
              //   child: FaIcon(
              //     prefixIcon,
              //     color: AppColors.subTitle,
              //   ),
              // ),
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
        ),
      ],
    );
  }
}
