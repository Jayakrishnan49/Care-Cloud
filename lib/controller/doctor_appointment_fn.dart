import 'package:care_cloud/model/doctor_appointment_db/doctor_appoitment_db.dart';
import 'package:hive/hive.dart';

class DoctorAppointmentDetails{
  Future<void>addAppointments(DoctorAppoitmentDb value)async{
    final doctorAppointmentData=Hive.box<DoctorAppoitmentDb>('doctorAppointmentBox');
    final _id=await doctorAppointmentData.add(value);
    value.id=_id;
  }
}