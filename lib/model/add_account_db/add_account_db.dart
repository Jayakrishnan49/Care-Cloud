
import 'package:hive/hive.dart';
part 'add_account_db.g.dart';

@HiveType(typeId: 1)
class ProfileDb extends HiveObject {

  @HiveField(0)
  int ?id;

  @HiveField(1)
  String username;

  @HiveField(2)
  String phoneno;

  @HiveField(3)
  String gender;

  @HiveField(4)
  String age;

  @HiveField(5)
  String ?address;

  @HiveField(6)
  String ?pincode;

  @HiveField(7)
  String ?city;

  @HiveField(8)
  String image;


  ProfileDb({this.id,required this.username,required this.phoneno,required this.gender,required this.age,this.address,this.pincode,this.city,required this.image});
}
