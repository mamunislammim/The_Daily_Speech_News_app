import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/models/User_registration_model.dart';
import 'package:news_app_with_api/screen/splash_screen.dart';
import 'package:news_app_with_api/screen/update_profile.dart';


    class MyProfileScreen extends StatelessWidget {
      const MyProfileScreen({Key? key}) : super(key: key);

      Widget build(BuildContext context) {
        double height = MediaQuery
            .of(context)
            .size
            .height;
        double width = MediaQuery
            .of(context)
            .size
            .width;
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.teal.withOpacity(.5),
            body: Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: height / 3.5,
                        width: width,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  "https://previews.123rf.com/images/zimmytws/zimmytws1906/zimmytws190600024/125211543-negative-newspaper-headlines-on-dark-textured-background.jpg"
                                ))),
                      ),
                      Positioned(
                        bottom: -55,
                        child: Row(
                          children: const [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTrtbQWAUbo97OQOHKopnMNwKh5lDBnlzpNw&usqp=CAU"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height/8,),
                    Text(
                   UserRegistrationModel().user?.firstName.toString() ?? "Mam",
                    style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
        );
      }
    }
