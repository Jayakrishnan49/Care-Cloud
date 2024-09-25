import 'package:care_cloud/utilities/colors.dart';
import 'package:flutter/material.dart';



class CustomVitalsField extends StatelessWidget {
  final TextEditingController? controller;
  final double? borderRadius;
  final double? width;
  final double? height;
  final IconData faIcon;
  final String title;
  final String measurementText;

  const CustomVitalsField({
    super.key,
    required this.controller,
    this.borderRadius,
    this.width,
    this.height,
    required this.faIcon,
    required this.title,
    required this.measurementText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 190,
      height: height ?? 160,
      decoration: BoxDecoration(
          // color: Colors.black12,
          border: Border.all(
            color: AppColors.subTitle,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                faIcon,
                color: AppColors.primary,
              ),
              Text(
                '  $title',
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            // height: 140,
            width: 140,
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: AppColors.subTitle),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: AppColors.subTitle),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(color: AppColors.primary, width: 2.0),
                ),
                hintStyle: const TextStyle(color: AppColors.subTitle),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            // ignore: unnecessary_string_interpolations
            '$measurementText',
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
