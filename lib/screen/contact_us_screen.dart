import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/repository/news_repository.dart';
import 'package:news_app_with_api/screen/home_screen.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _website = TextEditingController();
  final TextEditingController _message = TextEditingController();

  int _selectData = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: ListView(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, right: 25, left: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _selectData == 1
                        ? Colors.blue
                        : Colors.grey.withOpacity(.7)),
                child: const Text(
                  "Contact",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ).onTap(() {
                setState(() {
                  _selectData = 1;
                });
              }),
              Container(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, right: 25, left: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _selectData == 2
                        ? Colors.blue
                        : Colors.grey.withOpacity(.7)),
                child: const Text(
                  "Show All",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ).onTap(() {
                setState(() {
                  _selectData = 2;
                });
              }),
            ],
          ),
          _selectData == 1
              ? Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Enter Your Name",
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: AppTextField(
                        controller: _name,
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        textAlignVertical: TextAlignVertical.bottom,
                        textFieldType: TextFieldType.NAME,
                        decoration: InputDecoration(
                          hintText: "Enter name",
                          hintStyle: const TextStyle(color: Colors.greenAccent),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.greenAccent),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(
                            Icons.account_circle,
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Enter Your Email",
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: AppTextField(
                        controller: _email,
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        textAlignVertical: TextAlignVertical.bottom,
                        textFieldType: TextFieldType.EMAIL,
                        decoration: InputDecoration(
                          hintText: "Enter Email Address",
                          hintStyle: const TextStyle(color: Colors.greenAccent),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.greenAccent),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Enter Your Website Name",
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: AppTextField(
                        controller: _website,
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        textAlignVertical: TextAlignVertical.bottom,
                        textFieldType: TextFieldType.URL,
                        decoration: InputDecoration(
                          hintText: "Enter Website Address",
                          hintStyle: const TextStyle(color: Colors.greenAccent),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.greenAccent),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(
                            Icons.web_sharp,
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Enter Your Message",
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    AppTextField(
                      controller: _message,
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 17),
                      maxLines: 50,
                      textAlignVertical: TextAlignVertical.bottom,
                      textFieldType: TextFieldType.MULTILINE,
                      decoration: InputDecoration(
                        hintText: "Enter Message here...",
                        hintStyle: const TextStyle(color: Colors.greenAccent),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.greenAccent),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.lightBlue.withOpacity(.7)),
                        child: const Center(
                            child: Text(
                          "Sent",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ))).onTap(() async {
                          if(_name.text.isEmpty){
                            toast("Please, Enter Your Name");
                          }
                          else if(_email.text.isEmpty){
                            toast("Please, Enter Your Email Address");
                          }
                          else if(_message.text.isEmpty){
                            toast("Please,Write a message");
                          }
                          else{
                            EasyLoading.show(status: "Sending Message");
                            var result = await NewsRepo().contactUsRepo(
                                _name.text, _email.text, _message.text);
                            if (result) {
                              EasyLoading.showSuccess("Message Sent Successfully");
                              HomeScreen().launch(context);
                            } else {
                              EasyLoading.showError("Sending Failed");
                            }
                          }
                    }),
                  ],
                )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(height: 100,),
                    Text("No Message Here",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)],
                )
        ],
      ),
    );
  }
}
