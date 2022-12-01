import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/repository/news_repository.dart';
import 'home_screen.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmNewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.teal,
      body: ListView(
        padding: EdgeInsets.only(top: height / 8, left: 20, right: 20),
        children: [
          const Text(
            "Current Password",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          AppTextField(
            controller: _currentPassword,
            textFieldType: TextFieldType.PASSWORD,
            textStyle: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.security_outlined,
                  color: Colors.white,
                ),
                hintText: "******",
                hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white))),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "New Password",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          AppTextField(
            controller: _newPassword,
            textFieldType: TextFieldType.PASSWORD,
            textStyle: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.security_outlined,
                  color: Colors.white,
                ),
                hintText: "******",
                hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white))),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Confirm New Password",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          AppTextField(
            controller: _confirmNewPassword,
            textFieldType: TextFieldType.PASSWORD,
            textStyle: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.security_outlined,
                  color: Colors.white,
                ),
                hintText: "******",
                hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white))),
          ),
          SizedBox(
            height: height / 20,
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
          ).onTap(() async {
            EasyLoading.show(status: "Updating Password");
            var result = await NewsRepo().changePasswordRepo(
                _currentPassword.text,
                _newPassword.text,
                _confirmNewPassword.text);
            if (result) {
              EasyLoading.showSuccess("Password Update Successful");
              HomeScreen().launch(context);
            } else {
              EasyLoading.showError("Failed");
            }
          }),
        ],
      ),
    );
  }
}
