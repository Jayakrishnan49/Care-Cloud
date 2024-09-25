import 'package:care_cloud/model/vitals_db/vitals_db.dart';
import 'package:hive_flutter/hive_flutter.dart';


class VitalsDetails {
  Future<void> addVitals(VitalsDb value) async {
    final vitalsData = Hive.box<VitalsDb>('vitalsBox');
    final _id = await vitalsData.add(value);
    value.id = _id;
    // Print the entire box contents to the console
    // for (var vital in vitalsData.values) {
    //   log('Date: ${vital.date}, Time: ${vital.time}, BP: ${vital.bp}, Pulse: ${vital.pulse}, '
    //       'Temperature: ${vital.temperature}, Weight: ${vital.weight}, SpO2: ${vital.spo2}, Exercise: ${vital.exercise}');
    // }
  }
}




