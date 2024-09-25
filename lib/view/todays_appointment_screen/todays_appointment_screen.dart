import 'package:care_cloud/model/doctor_appointment_db/doctor_appoitment_db.dart';
import 'package:care_cloud/utilities/colors.dart';
import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';


class TodaysAppointmentScreen extends StatelessWidget {
  const TodaysAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String todayDate = DateFormat('dd MMM yyyy').format(DateTime.now());
    _removePastAppointments(todayDate);

    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        title: const Text('Today\'s Appointments'),
      ),
      body: ValueListenableBuilder(
        valueListenable:
            Hive.box<DoctorAppoitmentDb>('doctorAppointmentBox').listenable(),
        builder: (context, Box<DoctorAppoitmentDb> box, child) {
          List<DoctorAppoitmentDb> todaysAppointments = [];
          for (int i = 0; i < box.length; i++) {
            DoctorAppoitmentDb appointment = box.getAt(i)!;
            if (appointment.date == todayDate) {
              todaysAppointments.add(appointment);
            }
          }

          if (todaysAppointments.isEmpty) {
            return const Center(
              child: Text("You don't have any appointments for today"),
            );
          }

          return ListView.builder(
            itemCount: todaysAppointments.length,
            itemBuilder: (context, index) {
              final appointment = todaysAppointments[index];
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Card(
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${appointment.date}, ${appointment.time}',
                          style: const TextStyle(
                              color: Colors.green, fontSize: 18),
                        ),

                        const SizedBox(height: 8),
                        Text(
                          "Dotor's Name: ${appointment.doctorName}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        // const SizedBox(height: 8),
                        Text(appointment.address.toString()),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _removePastAppointments(String todayDate) {
    var box = Hive.box<DoctorAppoitmentDb>('doctorAppointmentBox');
    DateTime today = DateFormat('dd MMM yyyy').parse(todayDate);

    for (int i = box.length - 1; i >= 0; i--) {
      DoctorAppoitmentDb appointment = box.getAt(i)!;
      DateTime appointmentDate =
          DateFormat('dd MMM yyyy').parse(appointment.date);
      if (appointmentDate.isBefore(today)) {
        box.deleteAt(i);
      }
    }
  }
}
