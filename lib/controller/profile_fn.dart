

import 'package:care_cloud/model/add_account_db/add_account_db.dart';
import 'package:hive_flutter/hive_flutter.dart';


class ProfileDetails{
  Future<void>addProfileDetails(ProfileDb value)async{
    final profileData=await Hive.box<ProfileDb>('profileBox');
    final _id=await profileData.add(value);
    value.id=_id;
   
  }
}