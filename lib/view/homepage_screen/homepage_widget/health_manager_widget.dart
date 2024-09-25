import 'package:care_cloud/utilities/health_manager_catagory.dart';
import 'package:flutter/material.dart';


class HealthManagerSection extends StatelessWidget {
  final List<String> texts;
  final List<String> images;
  final List<Widget> screens;

  const HealthManagerSection({
    super.key,
    required this.texts,
    required this.images,
    required this.screens,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          const Text(
            'Health Manager',
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 20),
          // Row(
          //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: List.generate(3, (index) {
          //     return HealthManagerCatagory(
          //       text: texts[index],
          //       image: images[index],
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => screens[index]),
          //         );
          //       },
          //     );
          //   }),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(3, (index) {
                  return HealthManagerCatagory(
                    text: texts[index],
                    image: images[index],
                    onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screens[index]),
            );
                    },
                  );
                    }),
                  ),
          ),
      
          const SizedBox(height: 20),
          if (texts.length > 3)
            HealthManagerCatagory(
              text: texts[3],
              image: images[3],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => screens[3]),
                );
              },
            ),
        ],
      ),
    );
  }
}
