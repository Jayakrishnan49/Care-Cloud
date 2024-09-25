import 'package:flutter/material.dart';

class HealthManagerCatagory extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  final String? image;

  const HealthManagerCatagory({super.key, this.onTap, this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            // color: AppColors.subTitle,
            height: 60,
            width: 60,
            child: Image.asset(image!),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
