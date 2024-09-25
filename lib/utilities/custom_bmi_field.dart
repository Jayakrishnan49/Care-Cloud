
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/customTextfornField.dart';
import 'package:flutter/material.dart';


class CustomBmiField extends StatelessWidget {
  final TextEditingController controller;
  final double? width;
  final double? height;
  final String labelText;
  final String textMeassurement;
  final IconData? icon;
  final Color? borderColor;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;

  const CustomBmiField({
    super.key,
    required this.controller,
    this.width,
    this.height,
    required this.labelText,
    required this.textMeassurement,
    this.icon,
    this.borderColor,
    this.autovalidateMode,
    this.keyboardType,
    }
    );

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: width?? 160,
                  height: height?? 140,
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    border: Border.all(
                      color:borderColor?? AppColors.subTitle,
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                      // SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(top: 5,left: 15),
                        child: Text(labelText,style: TextStyle(fontSize: 15),),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            controller: controller,
                            width: 100,
                            borderRadius: 15,
                            icon: icon,
                            keyboardType:keyboardType?? TextInputType.number, 
                            validator: (value) {
                              if(value==null || value.trim().isEmpty){
                                return 'Enter height';
                              }
                              else{
                                return null;
                              }
                            }, 
                            autovalidateMode:autovalidateMode?? AutovalidateMode.onUserInteraction,
                          ),
                          // SizedBox(width: 10,),
                          Text(textMeassurement,style: TextStyle(color: AppColors.primary),)
                        ],
                      )
                    ],
                  ),
                );  
  }
}