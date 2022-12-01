import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/Riverpod/riverpod_repo.dart';
import 'package:news_app_with_api/models/Category_news_list_models.dart';

import 'news_details_screen.dart';

class CategoryNewsListScreen extends StatefulWidget {
  const CategoryNewsListScreen({Key? key, required this.getId})
      : super(key: key);
  final String? getId;

  @override
  State<CategoryNewsListScreen> createState() => _CategoryNewsListScreenState();
}

class _CategoryNewsListScreenState extends State<CategoryNewsListScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(colors: [
            Colors.blue.withOpacity(.3),
            Colors.green.withOpacity(.3)
          ], end: Alignment.topRight, begin: Alignment.bottomRight),
          color: Colors.blueAccent,
        ),
        child: Consumer(builder: (_, ref, watch) {
          AsyncValue<CategoryNewsListModels> categoryNewsList =
              ref.watch(categoryNewsListRiverpod(widget.getId));
          return categoryNewsList.when(data: (news) {
            return ListView.builder(
              itemCount: news.datas!.data!.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.green],
                        end: Alignment.topRight,
                        begin: Alignment.bottomRight),
                    color: Colors.blueAccent,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 7, bottom: 10, left: 4, right: 4),
                        height: height / 2.5,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                news.datas!.data![index].image![0].toString(),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          news.datas!.data![index].title.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Read More",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ).onTap(() {
                  NewsDetailsScreen(
                    endPointID: news.datas!.data![index].id.toString(),
                  ).launch(context);
                });
              },
            );
          }, error: (e, stack) {
            return Text(e.toString());
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
        }),
      ),
    );
  }
}
