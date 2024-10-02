import 'package:care_cloud/controller/vitals_fn.dart';
import 'package:care_cloud/model/vitals_db/vitals_db.dart';
import 'package:care_cloud/utilities/custom_snackbar.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:flutter/material.dart';


class VitalsSaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final VitalsDetails vitalsDetails;
  final List<TextEditingController> controllers;
  final TextEditingController dateController;
  final TextEditingController timeController;

  const VitalsSaveButton({
    super.key,
    required this.formKey,
    required this.vitalsDetails,
    required this.controllers,
    required this.dateController,
    required this.timeController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Save',
      width: 400,
      borderRadius: 10,
      onTap: () {
        if (formKey.currentState!.validate()) {
          if (dateController.text.isEmpty || timeController.text.isEmpty) {
            CustomSnackbar.show(context: context, text: 'Please enter both date and time.', backgroundColor: Colors.red);
            return;
          }
          vitalsDetails.addVitals(
            VitalsDb(
              date: dateController.text,
              time: timeController.text,
              bp: controllers[0].text,
              pulse: controllers[1].text,
              temperature: controllers[2].text,
              weight: controllers[3].text,
              spo2: controllers[4].text,
              exercise: controllers[5].text,
            ),
          );
          CustomSnackbar.show(context: context, text: 'Vitals updated successfully', backgroundColor: Colors.green);
        }
      },
    );
  }
}
