import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:test_flutter/cubits/article_cubit/articles_cubit.dart';
import 'package:test_flutter/screens/single_article_screen.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  bool isloading = true;
  dynamic articles1 = {};
  @override
  void initState() {
    BlocProvider.of<ArticlesCubit>(context).getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.size.height * 0.1,
          ),
          SizedBox(
            height: Get.size.height * 0.1,
            child: const Text(
              "Tous Les Articles ",
              style: TextStyle(
                color: Color.fromRGBO(112, 74, 209, 1),
                fontFamily: 'Montserrat',
                fontSize: 25,
              ),
            ),
          ),
          BlocConsumer<ArticlesCubit, ArticlesState>(
            listener: (context, state) {
              if (state is ArticlesLoading) {
                isloading = true;
              } else if (state is ArticlesSuccess) {
                isloading = false;

                articles1 = state.articles;
                //articles1.addAll(state.articles);
              } else if (state is ArticlesFailed) {
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: Get.size.width * 0.5,
                                child: const Center(
                                  child: Text('Titre',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 10,
                                          color: Colors.black)),
                                )),
                            SizedBox(
                                width: Get.size.width * 0.2,
                                child: const Text('Id',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 10,
                                        color: Colors.black))),
                            SizedBox(
                                width: Get.size.width * 0.2,
                                child: const Text('user id',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 10,
                                        color: Colors.black))),
                          ],
                        ),
                        SizedBox(
                          height: Get.size.height * 0.75,
                          child: RefreshIndicator(
                            onRefresh: () async {
                              context.read<ArticlesCubit>().getArticles();
                            },
                            child: ListView.separated(
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: articles1.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: Get.size.height * 0.07,
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(SingleArticleScreen(
                                          id: articles1[index]['id']
                                              .toString()));
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: Get.size.width * 0.1,
                                        ),
                                        SizedBox(
                                          width: Get.size.width * 0.3,
                                          child: Text(articles1[index]['title'],
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(
                                          width: Get.size.width * 0.15,
                                        ),
                                        SizedBox(
                                          width: Get.size.width * 0.1,
                                          child: Text(
                                              articles1[index]['id'].toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(
                                          width: Get.size.width * 0.1,
                                        ),
                                        SizedBox(
                                          width: Get.size.width * 0.1,
                                          child: Text(
                                              articles1[index]['userId']
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
            },
          )
        ],
      ),
    );
  }
}
