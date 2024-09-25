  import 'package:care_cloud/model/add_account_db/add_account_db.dart';
import 'package:care_cloud/model/blood_glucose_db/blood_glucose_db.dart';
import 'package:care_cloud/model/doctor_appointment_db/doctor_appoitment_db.dart';
import 'package:care_cloud/model/user_records_db/user_record_db.dart';
import 'package:care_cloud/model/username_and_password_db/userpassword_db.dart';
import 'package:care_cloud/model/vitals_db/vitals_db.dart';
import 'package:care_cloud/view/splash_screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';


const saveKey='key';
const profSavekey='profKey';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserPassDbAdapter());
  Hive.registerAdapter(ProfileDbAdapter());
  Hive.registerAdapter(VitalsDbAdapter());
  Hive.registerAdapter(BloodGlucoseDbAdapter());
  Hive.registerAdapter(UserRecordDbAdapter());
  Hive.registerAdapter(DoctorAppoitmentDbAdapter());


  await Hive.openBox<UserPassDb>('dataBox');
  await Hive.openBox<ProfileDb>('profileBox');
  await Hive.openBox<VitalsDb>('vitalsBox');
  await Hive.openBox<BloodGlucoseDb>('bloodGlucoseBox');
  await Hive.openBox<UserRecordDb>('userRecordBox');
  await Hive.openBox<DoctorAppoitmentDb>('doctorAppointmentBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: BmiCalculator(),
      // home: CustomVitalsField(),
      // home: MyVitals(),
      // home: ProfileScreen(),
      // home: AddAccount(),
      // home: EditProfileScreen(),
      // home: LoginScreen(),
      // home: SelectionScreen()

    );
  }
}


