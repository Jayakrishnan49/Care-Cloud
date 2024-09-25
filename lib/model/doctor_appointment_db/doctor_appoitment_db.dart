import 'package:hive/hive.dart';
part 'doctor_appoitment_db.g.dart';

@HiveType(typeId: 5)
class DoctorAppoitmentDb extends HiveObject{
  @HiveField(0)
  int ?id;

  @HiveField(1)
  String doctorName;

  @HiveField(2)
  String hospitalName;

  @HiveField(3)
  String date;

  @HiveField(4)
  String time;

  @HiveField(5)
  String? address;

  DoctorAppoitmentDb({this.id,required this.doctorName, required this.hospitalName, required this.date,required this.time, this.address});
}