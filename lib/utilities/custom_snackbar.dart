// import 'package:flutter/material.dart';

// class CustomSnackbar {
//   final String text;
//   final Color backgroundColor;

//   CustomSnackbar({
//     required this.text,
//     required this.backgroundColor,
//   });

//   void snackBar(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(text),
//         behavior: SnackBarBehavior.floating,
//         backgroundColor: backgroundColor, // Use the provided backgroundColor
//         margin: const EdgeInsets.all(20),
//         duration: const Duration(seconds: 3),
//         showCloseIcon: true,
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// class CustomSnackbar {
//   static void show(required BuildContext context,required String text, required Color backgroundColor) {
//     final snackBar = SnackBar(
//       content: Text(text),
//       behavior: SnackBarBehavior.floating,
//       backgroundColor: backgroundColor,
//       margin: const EdgeInsets.all(20),
//       duration: const Duration(seconds: 3),
//       showCloseIcon: true,
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }




import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show({
    required BuildContext context,
    required String text,
    required Color backgroundColor,
  }) {
    final snackBar = SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      margin: const EdgeInsets.all(20),
      duration: const Duration(seconds: 3),
      showCloseIcon: true,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
