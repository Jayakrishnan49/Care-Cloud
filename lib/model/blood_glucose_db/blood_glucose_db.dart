import 'package:hive/hive.dart';
part 'blood_glucose_db.g.dart';
@HiveType(typeId: 3)
class BloodGlucoseDb extends HiveObject{
   @HiveField(0)
  int ?id;

  @HiveField(1)
  String date;

  @HiveField(2)
  String time;

  @HiveField(3)
  String glucose;

  @HiveField(4)
  String foodIntakeTimings;

  BloodGlucoseDb({this.id,required this.date,required this.time,required this.glucose,required this.foodIntakeTimings});
}