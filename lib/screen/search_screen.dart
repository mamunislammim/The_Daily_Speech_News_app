import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/models/Search_news_models.dart';
import 'package:news_app_with_api/repository/news_repository.dart';
import 'package:news_app_with_api/screen/news_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? _search;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
          SizedBox(
            width: width / 1.2,
            child: TextField(
              onSubmitted: (val) {
                setState(() {
                  _search = val;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
                hintText: "Search here...",
                hintStyle: TextStyle(color: Colors.white.withOpacity(.7)),
              ),
            ),
          ),
        ],
      ),

      body: FutureBuilder<SearchNewsModels>(
          future: NewsRepo().searchNews(_search ?? ''),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.datas!.data!.isEmpty) {
                return const Center(
                  child: Text('No Data Found'),
                );
              }
              else {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.datas?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: SizedBox(
                                    height: 100,
                                    child: Image.network(
                                       snapshot.data!.datas!.data![index].image![0].toString(),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          snapshot.data!.datas!.data![index].title.toString(),
                                          style: const TextStyle(color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "$index Days Ago",
                                              style:
                                              const TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              "Read more..",
                                              style: TextStyle(
                                                  color:
                                                  Colors.black.withOpacity(.5)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                          // Text(snapshot.data!.datas!.data![0].title.toString())
                        ],
                      ).onTap(() => NewsDetailsScreen(
                            endPointID: snapshot.data!.datas!.data![index].id
                                .toString(),
                          ).launch(context));
                    });
              }
            }
            else if (_search.isEmptyOrNull) {
              return const Center(
                child: Text('Waiting For your Search Query'),
              );
            }
            else {
              return const Padding(
                padding: EdgeInsets.only(top: 250),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),

    );
  }
}
