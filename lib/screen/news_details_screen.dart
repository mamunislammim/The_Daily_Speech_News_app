import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/Riverpod/riverpod_repo.dart';
import 'package:news_app_with_api/models/Details_news_model.dart';
import 'package:intl/intl.dart';
import 'package:news_app_with_api/repository/news_repository.dart';
import '../models/Get_news_comment_models.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({Key? key, required this.endPointID})
      : super(key: key);

  final String? endPointID;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  final TextEditingController _comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer(builder: (_, ref, watch) {
      AsyncValue<DetailsNewsModel> details =
          ref.watch(detailsNewsRiverpod(widget.endPointID));
      return details.when(data: (news) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async =>
                await ref.refresh(detailsNewsRiverpod(widget.endPointID)),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.black.withOpacity(.09),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff0b4151),
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
                        padding:
                            const EdgeInsets.only(top: 8, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              news.data!.date.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.8),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              news.data!.reporterName.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.8),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      // News Category
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          news.data!.newsCategory.toString(),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),

                      // Description
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          Bidi.stripHtmlIfNeeded(
                              news.data!.description.toString()),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),

                      Divider(
                        thickness: 5,
                        color: Colors.black.withOpacity(.5),
                      ),

                      // News Comment
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppTextField(
                          controller: _comment,
                          textStyle: const TextStyle(
                              color: Colors.black, fontSize: 17),
                          maxLines: 50,
                          textAlignVertical: TextAlignVertical.bottom,
                          textFieldType: TextFieldType.MULTILINE,
                          decoration: InputDecoration(
                            hintText: "Enter Comment here...",
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(.5)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),

                      // Comment Button
                      Container(
                        padding: const EdgeInsets.only(
                            top: 10, left: 15, right: 15, bottom: 10),
                        margin: const EdgeInsets.only(
                            top: 10, left: 15, right: 15, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.withOpacity(.7),
                        ),
                        child: Text(
                          "Comment",
                          style: TextStyle(
                              color: Colors.white, fontSize: width / 15),
                        ),
                      ).onTap(() async {
                        EasyLoading.show(status: "Sending Comment");
                        var result = await NewsRepo().newsComment(
                            news.data!.id.toString(), _comment.text);
                        if (result) {
                          _comment.clear();

                          EasyLoading.showSuccess("Done");
                        }
                      }),
                      Consumer(builder: (_, ref, watch) {
                        AsyncValue<GetNewsCommentModels> getComment = ref
                            .watch(getNewsCommentRiverpod(widget.endPointID));
                        return getComment.when(data: (news) {
                          return RefreshIndicator(
                            onRefresh: () async => await ref.refresh(
                                getNewsCommentRiverpod(widget.endPointID)),
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: news.datas!.data!.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 13, right: 13),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Divider(
                                          thickness: 3,
                                        ),
                                        Text(
                                          news.datas!.data![index].name
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: width / 15,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Colors.black.withOpacity(.8)),
                                        ),
                                        Text(
                                          news.datas!.data![index].comment
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: width / 20,
                                              color:
                                                  Colors.black.withOpacity(.8)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          );
                        }, error: (e, stack) {
                          return Center(
                            child: Text(e.toString()),
                          );
                        }, loading: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        });
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }, error: (e, stack) {
        return const Center(
            child: Text(
          "Data Not Found..!!!",
          style: TextStyle(
              color: Colors.tealAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ));
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      });
    });

  }
}
