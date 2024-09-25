import 'package:hive/hive.dart';
part 'user_record_db.g.dart';
@HiveType(typeId: 4)
class UserRecordDb extends HiveObject{
  @HiveField(0)
  int ?id;

  @HiveField(1)
  String image;

  @HiveField(2)
  String recordName;

  @HiveField(3)
  String date;

  @HiveField(4)
  String reportType;

  UserRecordDb({this.id,required this.image,required this.recordName,required this.date,required this.reportType});
}