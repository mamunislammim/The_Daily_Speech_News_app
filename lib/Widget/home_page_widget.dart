import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/Riverpod/riverpod_repo.dart';
import 'package:news_app_with_api/models/Latest_news_models.dart';
import 'package:news_app_with_api/screen/news_details_screen.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Consumer(
      builder: (_, ref,watch){
        AsyncValue<LatestNewsModels> latest = ref.watch(latestNewsRiverpod);
       return latest.when(
            data: (news){
              return ListView.builder(
                itemCount: news.datas!.data!.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                            NewsDetailsScreen(endPointID: news.datas!.data![index].id.toString(),).launch(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Colors.brown),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height/3.5,
                                width: 500,
                                child: Image.network(
                                 news.datas!.data![index].image![0],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Description is the pattern of narrative development that aims to make vivid a place,",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ).visible(index == 0),
                      ),
                      InkWell(
                        onTap: (){
                          NewsDetailsScreen(endPointID: news.datas!.data![index].id.toString(),).launch(context);
                        },
                        child: Container(
                          margin:  const EdgeInsets.only(bottom: 5),
                          decoration:    BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
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
                                    news.datas!.data![index].image![0],
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
                                        news.datas!.data![index].title.toString(),
                                        style: const TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(height: 5,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:   [
                                            Text("$index Days Ago",style: const TextStyle(color: Colors.grey),),
                                          Text("Read more..",style: TextStyle(color: Colors.black.withOpacity(.5)),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ).visible(index != 0),
                      )
                    ],
                  );
                },
              );

            },
            error: (e,stack){
              return Text(e.toString());
            },
            loading: (){
              return const Center(child: CircularProgressIndicator());
            }
        );
      },

    );
   }
}
