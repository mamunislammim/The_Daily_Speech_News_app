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
    Future.delayed(const Duration(seconds: 5));
    final String? token = prefs.getString("token");
    if(token.isEmptyOrNull){
      LoginScreen().launch(context);
    }
    else{
      HomeScreen().launch(context);
    }
  }

  @override
  void initState() {
      goScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue.withOpacity(.6),Colors.green.withOpacity(.6)])
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
