import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/custom_bmi_field.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';
// import 'package:project_1_carecloud/utilities/custom_bmi_field.dart';
// import 'package:project_1_carecloud/utilities/custombutton.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  final formkeyBmi = GlobalKey<FormState>();
  double? _bmi;
  String label = '';
  Color? labelColor;
  bool _isBmiCalculated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        title: const Text('BMI'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkeyBmi,
            child: Column(
              children: [
                if (_isBmiCalculated)
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${_bmi?.toStringAsFixed(2) ?? 0}: ',
                          style: TextStyle(color: labelColor, fontSize: 20),
                        ),
                        Text(
                          'Your BMI is $label',
                          style: TextStyle(color: labelColor, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                SfRadialGauge(
                  // backgroundColor:AppColors.subTitle,
                  axes: <RadialAxis>[
                    RadialAxis(
                      canRotateLabels: true,
                      canScaleToFit: true,
                      // centerX: 0.3,
                      startAngle: 90,
                      endAngle: 90,

                      minimum: 0,
                      maximum: 40,
                      interval: 2,
                      ranges: [
                        GaugeRange(
                          startValue: 0,
                          endValue: 18.5,
                          color: Colors.blue,
                          label: 'Underweight',
                          startWidth: 20,
                          endWidth: 20,
                        ),
                        GaugeRange(
                          startValue: 18.5,
                          endValue: 24.9,
                          color: Colors.green,
                          label: 'Normal',
                          startWidth: 20,
                          endWidth: 20,
                        ),
                        GaugeRange(
                          startValue: 25,
                          endValue: 29.9,
                          color: Colors.orange,
                          label: 'Overweight',
                          startWidth: 20,
                          endWidth: 20,
                        ),
                        GaugeRange(
                          startValue: 30,
                          endValue: 40,
                          color: Colors.red,
                          label: 'Obese',
                          startWidth: 20,
                          endWidth: 20,
                        ),
                      ],
                      pointers: [
                        NeedlePointer(
                          value: _bmi ?? 0,
                          enableAnimation: true,
                        )
                      ],
                      annotations: [
                        GaugeAnnotation(
                          widget: Text(
                            '${_bmi?.toStringAsFixed(2) ?? 0}',
                            style: const TextStyle(
                                color: AppColors.primary, fontSize: 25),
                          ),
                          angle: 90,
                          positionFactor: 0.3,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomBmiField(
                    controller: weightController,
                    labelText: 'Weight',
                    textMeassurement: ' *kg',
                    icon: FontAwesomeIcons.weightScale,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  CustomBmiField(
                    controller: heightController,
                    labelText: 'Height',
                    textMeassurement: ' *cm',
                    icon: FontAwesomeIcons.rulerVertical,
                  ),
                ]),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'Calculate BMI',
                  width: 350,
                  borderRadius: 10,
                  onTap: () {
                    calculateBmi();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  calculateBmi() {
    String weightText = weightController.text;
    String heightText = heightController.text;
    if (weightText.isNotEmpty && heightText.isNotEmpty) {
      double weight = double.parse(weightText);
      double heightCm = double.parse(heightText);
      double heightMeters = heightCm / 100;
      double bmi = weight / (heightMeters * heightMeters);

      // String bmiLabel = '';

      setState(() {
        _bmi = bmi;
        _isBmiCalculated = true;
        if (bmi < 18.5) {
          label = 'Underweight';
          labelColor = Colors.blue;
        } else if (bmi >= 18.5 && bmi < 25) {
          label = 'Normal';
          labelColor = Colors.green;
        } else if (bmi >= 25 && bmi < 30) {
          label = 'Overweight';
          labelColor = Colors.orange;
        } else {
          label = 'Obese';
          labelColor = Colors.red;
        }
        // label = bmiLabel;
      });
    }
  }
}
