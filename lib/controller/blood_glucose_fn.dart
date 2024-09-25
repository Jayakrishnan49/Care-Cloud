import 'package:care_cloud/model/blood_glucose_db/blood_glucose_db.dart';
import 'package:hive/hive.dart';

class BloodGlucoseDetails{
  Future<void>addBloodGlucose(BloodGlucoseDb value)async{
    final bloodGlucoseData=Hive.box<BloodGlucoseDb>('bloodGlucoseBox');
     final _id = await bloodGlucoseData.add(value);
    value.id = _id;
    // for (var bloodGlucose in bloodGlucoseData.values) {
    //   print('Date: ${bloodGlucose.date}, Time: ${bloodGlucose.time}, BP: ${bloodGlucose.glucose}, Pulse: ${bloodGlucose.foodIntakeTimings}, ');
    // }
  }
}