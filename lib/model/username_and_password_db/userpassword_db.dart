
// import 'package:hive/hive.dart';
// part 'database.g.dart';


// @HiveType(typeId: 0)

// class Database extends HiveObject {

//   @HiveField(0)
//   String ?username;

//   @HiveField(1)
//   String ?password;
// }

/////////////////////////////////////////////////////////

// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:hive/hive.dart';
part 'userpassword_db.g.dart';

@HiveType(typeId: 0)
class UserPassDb extends HiveObject {

  @HiveField(0)
  int ?id;

  @HiveField(1)
  String username;

  @HiveField(2)
  String password;

  UserPassDb({this.id,required this.username,required this.password});
}

