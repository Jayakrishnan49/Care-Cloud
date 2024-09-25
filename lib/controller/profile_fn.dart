

import 'package:care_cloud/model/add_account_db/add_account_db.dart';
import 'package:hive_flutter/hive_flutter.dart';


class ProfileDetails{
  Future<void>addProfileDetails(ProfileDb value)async{
    // ignore: await_only_futures
    final profileData=await Hive.box<ProfileDb>('profileBox');
    // ignore: no_leading_underscores_for_local_identifiers
    final _id=await profileData.add(value);
    value.id=_id;
   
  }
}