
import 'package:care_cloud/model/username_and_password_db/userpassword_db.dart';
import 'package:hive_flutter/hive_flutter.dart';


class SignupCrud{
  Future<void>addSignupData(UserPassDb value)async{
      // ignore: await_only_futures
      final signupDetails=await Hive.box<UserPassDb>('dataBox');
      // ignore: no_leading_underscores_for_local_identifiers
      final _id= await signupDetails.add(value);
      value.id=_id;
  }
}
