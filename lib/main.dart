import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/article_cubit/articles_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:  (context) => ArticlesCubit(), child:  const GetMaterialApp(
      home: HomePage(),
    ),);
  }
}
