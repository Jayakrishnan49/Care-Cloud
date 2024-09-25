import 'package:hive/hive.dart';
part 'vitals_db.g.dart';

@HiveType(typeId: 2)
class   VitalsDb extends HiveObject {

  @HiveField(0)
  int ?id;

  @HiveField(1)
  String date;

  @HiveField(2)
  String time;

  @HiveField(3)
  String ?bp;
  
  @HiveField(4)
  String ?pulse;

  @HiveField(5)
  String ?temperature;

  @HiveField(6)
  String ?weight;

  @HiveField(7)
  String ?spo2;

  @HiveField(8)
  String ?exercise;


  VitalsDb({this.id,required this.date,required this.time,this.bp,this.pulse,this.temperature,this.weight,this.spo2,this.exercise});
}