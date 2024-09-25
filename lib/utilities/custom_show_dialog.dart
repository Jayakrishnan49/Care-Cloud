import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:flutter/material.dart';


class CustomShowDialog extends StatelessWidget {
  final String title;
  final String? buttonLeft;
  final String? buttonRight;
  final String subTitle;
  final Icon icon;
  final VoidCallback onTap;
  const CustomShowDialog({
    super.key,
    required this.title,
    this.buttonLeft,
    this.buttonRight,
    required this.subTitle,
    required this.icon,
    required this.onTap,

    });

  @override
  Widget build(BuildContext context) {
   
                              return AlertDialog(
                                title:  Row( 
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    icon,
                                    const SizedBox(width: 8,),
                                    Text(
                                      title,
                                      style: const TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                content:  Text(
                                  subTitle,
                                  textAlign: TextAlign.center,
                                ),
                                actions: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomButton(
                                          text:buttonLeft ?? 'Cancel',
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
                                          text:buttonRight ?? 'Delete',
                                          width: 100,
                                          height: 45,
                                          textColor: AppColors.secondary,
                                          color: Colors.red,
                                          borderRadius: 10,
                                          borderColor: Colors.red,
                                          onTap: 
                                           onTap
                                          
                                        )
                                      ])
                                ],
                              );
                            
                          
  }
}
