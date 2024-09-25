import 'package:care_cloud/model/username_and_password_db/userpassword_db.dart';
import 'package:hive/hive.dart';



class LoginFn {
  Future<bool> isLogin({
    required String userName,
    required String passWord,
  }) async {
    final signupDetails = Hive.box<UserPassDb>('dataBox');
    
    for (var entry in signupDetails.values) {
      if (entry.username == userName && entry.password == passWord) {
        return true;
      }
    }
    return false;
  }
}
