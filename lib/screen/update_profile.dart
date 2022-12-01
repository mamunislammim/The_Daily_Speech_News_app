import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
 import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/repository/news_repository.dart';
import 'package:news_app_with_api/screen/home_screen.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _updateFName = TextEditingController();
  final TextEditingController _updateLName = TextEditingController();
  final TextEditingController _updateEmail = TextEditingController();
  final TextEditingController _updatePhone = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.teal,
      body: ListView(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        children: [
          const Text(
            "First Name",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          AppTextField(
            controller: _updateFName,
            textFieldType: TextFieldType.NAME,
            textStyle: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                hintText: "First Name",
                hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white))),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Last Name",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          AppTextField(
            controller: _updateLName,
            textFieldType: TextFieldType.NAME,
            textStyle: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                hintText: "Last Name",
                hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white))),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "E-mail Name",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          AppTextField(
            controller: _updateEmail,
            textFieldType: TextFieldType.NAME,
            textStyle: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                hintText: "email@gmail.com",
                hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white))),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Phone Number",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          AppTextField(
            controller: _updatePhone,
            textFieldType: TextFieldType.PHONE,
            textStyle: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                hintText: "017********",
                hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white))),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(top: 13, bottom: 13),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.blue),
            child: const Center(
              child: Text(
                "Update",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ).onTap(()async{
            EasyLoading.show(status: "Updating Data");
                var result = await NewsRepo().updateProfileRepo(_updateFName.text, _updateLName.text, _updateEmail.text, _updatePhone.text);
                if(result){
                  EasyLoading.showSuccess("Data Updated");
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('fName', _updateFName.text);
                  await prefs.setString('lName', _updateLName.text);
                  await prefs.setString('email',  _updateEmail.text);
                  await prefs.setString('phone', _updatePhone.text);
                  HomeScreen().launch(context);
                }
                else{
                  EasyLoading.showError("Failed");
                }
          }),
        ],
      ),
    );
  }
}
