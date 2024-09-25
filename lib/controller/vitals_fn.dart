import 'package:care_cloud/model/vitals_db/vitals_db.dart';
import 'package:hive_flutter/hive_flutter.dart';


class VitalsDetails {
  Future<void> addVitals(VitalsDb value) async {
    final vitalsData = Hive.box<VitalsDb>('vitalsBox');
    // ignore: no_leading_underscores_for_local_identifiers
    final _id = await vitalsData.add(value);
    value.id = _id;
  }
}




