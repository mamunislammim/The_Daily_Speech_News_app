import 'package:flutter/material.dart';
import 'package:news_app_with_api/models/Login_models.dart';

class AccountPageWidget extends StatelessWidget {
  const AccountPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: height / 4.5,
                width: width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://cms-assets.tutsplus.com/cdn-cgi/image/width=630/uploads/users/1631/posts/36346/image-upload/NewspaperTemplate04.jpg"))),
              ),
              const Positioned(
                bottom: -55,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTrtbQWAUbo97OQOHKopnMNwKh5lDBnlzpNw&usqp=CAU"),
                ),
              )
            ],
          ),

          SizedBox(
            height: height / 8,
          ),
          const Text("MD MAMUN ISLAM",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,),),
          //  Row(
          //    children: [
          //      Text(
          //          LoginModels().user?.firstName.toString()?? "",
          //       style: const TextStyle(
          //           color: Colors.tealAccent, fontSize: 25, fontWeight: FontWeight.bold),
          // ),
          //      Text(
          //        LoginModels().user?.lastName.toString()?? "",
          //        style: const TextStyle(
          //            color: Colors.tealAccent, fontSize: 25, fontWeight: FontWeight.bold),
          //      ),
          //    ],
          //  ),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.only(top: 10,bottom: 10,right: 15,left: 15),
            margin: const EdgeInsets.only(top: 10,bottom: 10,right: 15,left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: Colors.red),
              color: Colors.pink
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text("Rating",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 19),),
                    SizedBox(height: 5,),
                    Text("500",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                  ],
                ),
                Column(
                  children: const [
                    Text("Follower",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 19),),
                    SizedBox(height: 5,),
                    Text("800",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                  ],
                ),
                Column(
                  children: const [
                    Text("Follower",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 19),),
                    SizedBox(height: 5,),
                    Text("300",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
