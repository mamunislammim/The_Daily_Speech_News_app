import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/Data_List/server_config.dart';
import 'package:news_app_with_api/repository/news_repository.dart';
import 'package:news_app_with_api/screen/registration_screen.dart';

import 'home_screen.dart';

 class LoginScreen extends StatefulWidget {
   const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final TextEditingController _email = TextEditingController();
   final TextEditingController _password = TextEditingController();

   @override
   Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width;
     return SafeArea(
       child: Scaffold(
          body: Container(
            decoration:   BoxDecoration(
                gradient: LinearGradient(colors: [Colors.brown.withOpacity(.5),Colors.teal.withOpacity(.5)],end: Alignment.bottomRight,begin: Alignment.topLeft)
            ),
            child: ListView(
              padding:   EdgeInsets.only(left: 25,right: 25,top: height/5),
              children: [
                const Text("Enter Your Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                   const SizedBox(height: 5,),
                AppTextField(
                  controller: _email,
                  textFieldType: TextFieldType.EMAIL,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: "amarsopno678@gmail.com",
                  ),
                ),
                const SizedBox(height: 10,),
                const Text("Enter Your Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                const SizedBox(height: 5,),
                AppTextField(
                  controller: _password,
                textFieldType: TextFieldType.PASSWORD,
                  decoration:   InputDecoration(
                    hintText: "********",
                    prefixIcon: const Icon(Icons.security_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                 InkWell(
                   onTap: ()async{
                      if(_email.text.isEmpty){
                       toast("Enter Your Email");
                      }
                      else if(_password.text.isEmpty){
                       toast("Enter Your Password");
                      }
                      else if(_password.text.length < 6){
                      toast("Password must be 6 character");
                      }
                      else{
                        EasyLoading.show(status: "Signing In");
                        var result = await NewsRepo().logInRepo(_email.text, _password.text);
                        if(result){
                          EasyLoading.showSuccess(" Login Successful");
                          HomeScreen().launch(context);
                        }
                        else{
                          EasyLoading.showError(" Login Failed");
                        }
                      }
                   },
                   child: Container(
                     margin: const EdgeInsets.only(top: 20,bottom: 8),
                     padding: const EdgeInsets.only(top: 15,bottom: 15),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                       color: Colors.blue
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children:   [
                         Text("Sign In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: width/12),),
                       ],
                     ),
                   ),
                 ),
                  const Text("Forget password ?",style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                Row(
                  children:   [
                    const Text("Don't have any Account ?",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                    const SizedBox(width: 10,),
                    InkWell(
                        onTap: (){
                          const RegistrationScreen().launch(context);
                        },
                        child: const Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 16),))
                  ],
                ),
              ],
            ),
          ),
       ),
     );
   }
}
 