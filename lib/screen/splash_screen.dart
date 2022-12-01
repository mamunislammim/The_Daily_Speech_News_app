import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/screen/home_screen.dart';
import 'package:news_app_with_api/screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> goScreen()async{
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    Future.delayed(const Duration(seconds: 8)).then((value) {
    if(token.isEmptyOrNull){
      LoginScreen().launch(context);
    }
    else{
      HomeScreen().launch(context);
    }}
    );

  }

  @override
  void initState() {
     goScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
   double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue.withOpacity(.6),Colors.green.withOpacity(.6)])
        ),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: height/5.2),
              child: const Text("The",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 50),),
            ),
          const Text("Daily Speech",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 50),),

            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/splash_avatar.png"))
              ),
            ),
          ],
        ),
      ),
    );
  }
}
