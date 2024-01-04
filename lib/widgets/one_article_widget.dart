import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OneArticleWidget extends StatelessWidget {
  const OneArticleWidget({super.key, required this.titre, required this.corps});
  final String titre;
  final String corps;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width * 0.9,
      height: Get.size.height * 0.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(112, 74, 209, 0.6),
            width: 2,
          ),
          color: const Color.fromRGBO(255, 255, 255, 1)),
      child: Column(
        children: [
          SizedBox(
            height: Get.size.height * 0.02,
          ),
          const Text("Titre :",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(58, 22, 127, 1))),
          SizedBox(
            height: Get.size.height * 0.02,
          ),
          Text(titre,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(58, 22, 127, 1))),
          SizedBox(
            height: Get.size.height * 0.02,
          ),
          const Divider(color: Color.fromRGBO(58, 22, 127, 1)),
          SizedBox(
            height: Get.size.height * 0.02,
          ),
          Text(corps,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(58, 22, 127, 1))),
        ],
      ),
    );
  }
}
