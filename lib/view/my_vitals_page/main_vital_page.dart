import 'package:care_cloud/controller/vitals_fn.dart';
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/custom_date.dart';
import 'package:care_cloud/utilities/custom_time.dart';
import 'package:care_cloud/view/my_vitals_page/vitals_input.dart';
import 'package:care_cloud/view/my_vitals_page/vitals_save_button.dart';
import 'package:care_cloud/view/my_vitals_page/vitals_view_section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
class NewMyVitals extends StatefulWidget {
  const NewMyVitals({super.key});

  @override
  NewMyVitalsState createState() => NewMyVitalsState();
}

class NewMyVitalsState extends State<NewMyVitals> {
  String selectedType = 'BP';
  final VitalsDetails _vitalsDetails = VitalsDetails();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController dateController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    final List<TextEditingController> controllers = List.generate(6, (_) => TextEditingController());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          title: const Text('Vitals', style: TextStyle(color: AppColors.title)),
          backgroundColor: AppColors.secondary,
          bottom: const TabBar(
            dividerHeight: 0,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
            labelStyle: TextStyle(fontSize: 18),
            unselectedLabelColor: AppColors.title,
            tabs: [
              Tab(text: 'Add Vitals'),
              Tab(text: 'View'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                         CustomDate(
                          hintText: 'Select Date',
                          prefixIcon: FontAwesomeIcons.calendar,
                          iconButton: FontAwesomeIcons.circleChevronDown,
                          controller: dateController,
                          onPressed: () async {
                            final DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                            );

                            if (date != null) {
                              String formattedDate =
                                  DateFormat('dd MMM yyyy').format(date);
                              setState(() async {
                                dateController.text = formattedDate;
                              });
                            }
                          }),
                      const SizedBox(
                        height: 25,
                      ),

                      CustomTime(
                        controller: timeController,
                        prefixIcon: FontAwesomeIcons.clock,
                        hintText: 'Select Time',
                        iconButton: FontAwesomeIcons.circleChevronDown,
                        onPressed: () async {
                          // ignore: no_leading_underscores_for_local_identifiers
                          final TimeOfDay? _time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          setState(() async {
                            timeController.text = _time!.format(context);
                          });
                        },
                      ),
                      const SizedBox(height: 25,),
                      VitalsInputGrid(controllers: controllers),
                      const SizedBox(height: 20),
                      VitalsSaveButton(
                        formKey: formKey,
                        vitalsDetails: _vitalsDetails,
                        controllers: controllers,
                        dateController: dateController,
                        timeController: timeController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            VitalsViewSection(
              selectedType: selectedType,
              onTypeSelected: (type) {
                setState(() {
                  selectedType = type;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
