import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/Riverpod/riverpod_repo.dart';
import 'package:news_app_with_api/models/News_category_model.dart';
import 'package:news_app_with_api/screen/news_details_screen.dart';

class CategoryPageWidget extends StatelessWidget {
  const CategoryPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer(
      builder: (_,ref, watch){
        AsyncValue<NewsCategoryModel> category = ref.watch(newsCategoryRiverpod);
        return category.when(
            data: (news){
              return GridView.builder(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  itemCount: news.datas!.data!.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    //childAspectRatio: .9,
                  ),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: (){
                        NewsDetailsScreen(endPointID: news.datas!.data![index].id.toString(),).launch(context);
                      },
                      child: Container(
                        width: width / 2,
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
                              height: height / 5,
                              decoration:   BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                      news.datas!.data![index].image.toString(),
                                      ),
                                      fit: BoxFit.fill)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                               news.datas!.data![index].name.toString(),
                                style: TextStyle(
                                    fontSize: width/17,
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            error: (e,stack){
              return Text(e.toString());
            },
            loading: (){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
        );
      },

    );

  }
}
