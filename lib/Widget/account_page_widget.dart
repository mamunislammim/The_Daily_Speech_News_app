import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/screen/splash_screen.dart';

import '../screen/update_profile.dart';

class AccountPageWidget extends StatelessWidget {
  const AccountPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
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
        ],
      ),
    );
  }
}
