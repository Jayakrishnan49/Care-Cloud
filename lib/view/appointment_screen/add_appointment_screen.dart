import 'package:care_cloud/model/doctor_appointment_db/doctor_appoitment_db.dart';
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/custom_show_dialog.dart';
import 'package:care_cloud/utilities/custom_snackbar.dart';
import 'package:care_cloud/view/appointment_screen/appointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:project_1_carecloud/model/doctor_appointment_db/doctor_appoitment_db.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';
// import 'package:project_1_carecloud/utilities/custom_show_dialog.dart';
// import 'package:project_1_carecloud/utilities/custom_snackbar.dart';
// import 'package:project_1_carecloud/view/appointment_screen/appointment_screen.dart';

class AddAppointmentScreen extends StatelessWidget {
  const AddAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        icon: const FaIcon(
          FontAwesomeIcons.calendarCheck,
          color: AppColors.secondary,
          size: 20,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AppointmentScreen()),
          );
        },
        label: const Text(
          'New',
          style: TextStyle(color: AppColors.secondary, fontSize: 15),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable:
              Hive.box<DoctorAppoitmentDb>('doctorAppointmentBox').listenable(),
          builder: (context, Box<DoctorAppoitmentDb> box, child) {
            if (box.isEmpty) {
              return const Center(
                child: Text("You don't have any appointments yet"),
              );
            } else {
              return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final doctorAppoitment =
                        box.getAt(index) as DoctorAppoitmentDb;
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: GestureDetector(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomShowDialog(title: 'Delete Appointment', subTitle: 'Please confirm if you want to delete this \n appointment', icon: const Icon(Icons.delete,color: Colors.red,), onTap: (){
                                box.deleteAt(index);
                                            Navigator.of(context).pop();
                                           
                                            CustomSnackbar.show(context: context, text: 'Record deleted', backgroundColor: Colors.red);

                                            
                               });
                          
                            },
                          );
                          
                        },
                        child: Card(
                          color: Colors.white70,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${doctorAppoitment.date}, ${doctorAppoitment.time}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  doctorAppoitment.doctorName,
                                  style:
                                      const TextStyle(color: Colors.blueGrey),
                                ),
                                Text(
                                  doctorAppoitment.address.toString(),
                                  style:
                                      const TextStyle(color: Colors.blueGrey),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}

