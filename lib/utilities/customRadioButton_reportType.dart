import 'package:care_cloud/utilities/colors.dart';
import 'package:flutter/material.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';

class CustomRadioButtonReportType extends StatelessWidget {
  final List<String> label = [
    'Lab Tests',
    'Prescriptions',
    'Scans',
    'Others',
  ];
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  CustomRadioButtonReportType({
    super.key,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: label.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Radio<String>(
                activeColor: AppColors.primary,
                value: label[index],
                groupValue: groupValue,
                onChanged: onChanged,
              ),
              Text(label[index]),
            ],
          );
        },
      ),
    );
  }
}
