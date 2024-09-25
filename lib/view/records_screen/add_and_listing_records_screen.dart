import 'dart:io';
import 'package:care_cloud/model/user_records_db/user_record_db.dart';
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:care_cloud/view/records_screen/edit_records_screen.dart';
import 'package:care_cloud/view/records_screen/full_size_image_view.dart';
import 'package:care_cloud/view/records_screen/records_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
class AddAndListingRecordsScreen extends StatefulWidget {
  const AddAndListingRecordsScreen({super.key});

  @override
  State<AddAndListingRecordsScreen> createState() =>
      _AddAndListingRecordsScreenState();
}

class _AddAndListingRecordsScreenState
    extends State<AddAndListingRecordsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        icon: const FaIcon(
          FontAwesomeIcons.arrowUpFromBracket,
          color: AppColors.secondary,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RecordsScreen()),
          );
        },
        label: const Text(
          'Upload records',
          style: TextStyle(color: AppColors.secondary),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<UserRecordDb>('userRecordBox').listenable(),
        builder: (context, Box<UserRecordDb> box, child) {
          if (box.isEmpty) {
            return const Center(
              child: Text('No records available'),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                final userRecord = box.getAt(index) as UserRecordDb;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FullSizeImageView(
                                imagePath: userRecord.image)));
                  },
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                (Icons.delete),
                                color: Colors.red,
                              ),
                              Text(
                                'Delete Record',
                                style: TextStyle(
                                    color: AppColors.primary, fontSize: 20),
                              ),
                            ],
                          ),
                          content: const Text(
                            'Please confirm if you want to delete this \n Document',
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                    text: 'Cancel',
                                    width: 100,
                                    height: 45,
                                    color: AppColors.subTitle,
                                    textColor: AppColors.title,
                                    borderRadius: 10,
                                    borderColor: AppColors.subTitle,
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  CustomButton(
                                    text: 'Delete',
                                    width: 100,
                                    height: 45,
                                    textColor: AppColors.secondary,
                                    color: Colors.red,
                                    borderRadius: 10,
                                    borderColor: Colors.red,
                                    onTap: () {
                                      box.deleteAt(index);
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Record deleted',
                                            style: TextStyle(
                                                color: AppColors.secondary),
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    },
                                  )
                                ])
                          ],
                        );
                      },
                    );
                  },
                  child: Card(
                    elevation: 2,
                    color: Colors.white70,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                image: DecorationImage(
                                  image: FileImage(File(userRecord.image)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  userRecord.reportType,
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(userRecord.recordName),
                                const SizedBox(height: 15),
                                Text(userRecord.date),
                              ],
                            ),
                          ),
                        ),
                        IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditRecordsScreen(index: index,)));
                        }, 
                        icon: const Icon(Icons.edit_document))
                        
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}