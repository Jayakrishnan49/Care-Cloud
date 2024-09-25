// import 'dart:developer';
import 'package:care_cloud/model/user_records_db/user_record_db.dart';
import 'package:hive_flutter/adapters.dart';


class UserRecordDetails {
  Future<void> addUserRecords(UserRecordDb value) async {
    final userRecordData = Hive.box<UserRecordDb>('userRecordBox');
    final id = await userRecordData.add(value);
    value.id = id;
  
  }
}
