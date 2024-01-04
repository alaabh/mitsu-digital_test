import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_flutter/screens/acceuil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(const ArticleScreen());
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(112, 74, 209, 1)),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.fromLTRB(15, 10, 15, 10)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ))),
          child: const Text('Voir tous les articles'),
        ),
      ),
    );
  }
}
