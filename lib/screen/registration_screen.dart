import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/repository/news_repository.dart';
import 'package:news_app_with_api/screen/home_screen.dart';
import 'package:news_app_with_api/screen/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _fName = TextEditingController();
  final TextEditingController _lName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _cPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration:   BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue.withOpacity(.5),Colors.green.withOpacity(.5)],end: Alignment.bottomRight,begin: Alignment.topLeft)
        ),
        child: ListView(
          padding: const EdgeInsets.only(left: 25,right: 24,top: 35),
          children: [
            const Text("Enter Your First Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
            SizedBox(
              height: 45,
              child: AppTextField(
                controller: _fName,
                textAlignVertical: TextAlignVertical.bottom,
                textFieldType: TextFieldType.NAME,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.account_circle),
                  hintText: "First Name",
                ),
              ),
            ),
            const Text("Enter Your Last Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
            SizedBox(
              height: 45,
              child: AppTextField(
                controller: _lName,
                textAlignVertical: TextAlignVertical.bottom,
                textFieldType: TextFieldType.NAME,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.account_circle),
                  hintText: "Last Name",
                ),
              ),
            ),
            const Text("Enter Your Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
            SizedBox(
              height: 45,
              child: AppTextField(
                controller: _email,
                textAlignVertical: TextAlignVertical.bottom,
                textFieldType: TextFieldType.EMAIL,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: "amarsopno678@gmail.com",
                ),
              ),
            ),
            const Text("Enter Your Phone",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
             SizedBox(
               height: 45,
               child: AppTextField(
                 controller: _phone,
                 textAlignVertical: TextAlignVertical.bottom,
                textFieldType: TextFieldType.PHONE,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.phone),
                  hintText: "Phone Number",
                ),
            ),
             ),
            const Text("Enter Your Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
             SizedBox(
               height: 45,
               child: AppTextField(
                 controller: _password,
                 textAlignVertical: TextAlignVertical.bottom,
                textFieldType: TextFieldType.PASSWORD,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.security_sharp),
                  hintText: "********",
                ),
            ),
             ),
            const SizedBox(height: 5,),
            const Text("Enter Confirm Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
            SizedBox(
              height: 50,
              child: AppTextField(
                controller: _cPassword,
                textAlignVertical: TextAlignVertical.bottom,
                textFieldType: TextFieldType.PASSWORD,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.security_sharp),
                  hintText: "********",
                ),
              ),
            ),
            InkWell(
              onTap: ()async{
                if(_fName.text.isEmpty){
                  toast("Enter First Name");
                }
                else if(_lName.text.isEmpty){
                  toast("Enter Last Name");
                }
                else if(_email.text.isEmpty){
                  toast("Enter Email");
                }
                else if(_phone.text.isEmpty){
                  toast("Enter Phone");
                }
                else if(_password.text.isEmpty){
                  toast("Enter password");
                }
                else if(_cPassword.text.isEmpty){
                  toast("Enter Confirm Password");
                }
                else if(_password==_cPassword){
                  toast("Password Not Matched");
                }
                else if(_password.text.length < 6){
                  toast("Password Must be 6 Character");
                }
                else{
                 try{
                   var result = await NewsRepo().userRegistrationRepo(_fName.text, _lName.text, _email.text, _phone.text, _password.text, _cPassword.text);
                   if(result){
                     EasyLoading.showSuccess("Sign Up Successful");
                     HomeScreen().launch(context);
                   }
                   else{
                     EasyLoading.showError("$result");
                   }
                 }catch(e){
                   EasyLoading.showError(e.toString());
                 }
                }
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10,bottom: 8),
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(colors: [Colors.blue,Colors.green])
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:   [
                    Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: width/12),),
                  ],
                ),
              ),
            ),
            Row(
              children:   [
                const Text("Already have an Account ?",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                const SizedBox(width: 10,),
                InkWell(
                    onTap: (){
                      const LoginScreen().launch(context);
                    },
                    child: const Text("Sign In",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 16),))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
