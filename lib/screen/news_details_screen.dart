import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_with_api/Riverpod/riverpod_repo.dart';
import 'package:news_app_with_api/models/Details_news_model.dart';
import 'package:intl/intl.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({Key? key, required this.endPointID})
      : super(key: key);

  final String? endPointID;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Consumer(builder: (_, ref, watch) {
          AsyncValue<DetailsNewsModel> details =
              ref.watch(detailsNewsRiverpod(endPointID));
          return details.when(data: (news) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(
                        color: Colors.red,
                      ),
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Column(
                    children: [
                      Container(
                        height: height / 3.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(news.data!.image![0])),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          news.data!.title.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                  // Date
                  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(news.data!.date.toString()),
                ),

                // News Category
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(news.data!.newsCategory.toString()),
                ),

                //Comments
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(news.data!.comments.toString()),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Bidi.stripHtmlIfNeeded(news.data!.description.toString()),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            );
          }, error: (e, stack) {
            return const Center(child: Text("Data Not Found..!!!",style: TextStyle(color: Colors.tealAccent,fontSize: 20,fontWeight: FontWeight.bold),));
          }, loading: () {
            return const Center(child: CircularProgressIndicator());
          });
        }),
      ),
    );
  }
}
