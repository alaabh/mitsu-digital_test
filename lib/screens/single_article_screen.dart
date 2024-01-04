import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:test_flutter/cubits/article_cubit/articles_cubit.dart';
import 'package:test_flutter/widgets/one_article_widget.dart';
import 'package:dotted_border/dotted_border.dart';

class SingleArticleScreen extends StatefulWidget {
  const SingleArticleScreen({super.key, required this.id});
  final dynamic id;
  @override
  State<SingleArticleScreen> createState() => _SingleArticleScreenState();
}

class _SingleArticleScreenState extends State<SingleArticleScreen> {
  bool isloading = true;
  dynamic article1 = {};
  @override
  void initState() {
    BlocProvider.of<ArticlesCubit>(context).getSingleArticle(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ArticlesCubit, ArticlesState>(
        listener: (context, state) {
          if (state is SingleArticlesLoading) {
            isloading = true;
          } else if (state is SingleArticlesSuccess) {
            article1 = state.article;

            isloading = false;
          } else if (state is SingleArticlesFailed) {
            isloading = false;
            Get.snackbar(
              "error",
              "somthing went wrong ",
              backgroundColor: Colors.red.withOpacity(0.2),
              snackPosition: SnackPosition.TOP,
            );
          }
        },
        builder: (context, state) {
          return isloading == true
              ? SizedBox(
                  height: Get.size.height * 0.8,
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                            color: Color.fromRGBO(112, 74, 209, 1)),
                      ],
                    ),
                  ),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: Get.size.height * 0.1,
                    ),
                    SizedBox(
                      width: Get.size.width * 0.9,
                      child: Row(children: <Widget>[
                        const Text("Deatails Article",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        const Spacer(),
                        SizedBox(
                          height: 35,
                          child: DottedBorder(
                            radius: const Radius.circular(4),
                            borderType: BorderType.RRect,
                            color: const Color.fromRGBO(112, 74, 209, 1),
                            strokeWidth: 1,
                            child: TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Center(
                                child: Row(
                                  children: <Widget>[
                                    Text('Retour',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 13,
                                          color:
                                              Color.fromRGBO(112, 74, 209, 1),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.05,
                    ),
                    Center(
                      child: Text(
                        "Article numero : ${article1['id']} de l'utilisateur: ${article1['userId']} ",
                        style: const TextStyle(
                          color: Color.fromRGBO(112, 74, 209, 1),
                          fontFamily: 'Montserrat',
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.1,
                    ),
                    OneArticleWidget(
                        titre: article1['title'], corps: article1['body'])
                  ],
                );
        },
      ),
    );
  }
}
