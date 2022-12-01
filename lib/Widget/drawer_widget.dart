import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
 import 'package:nb_utils/nb_utils.dart';

import '../repository/news_repository.dart';
import '../screen/change_password_screen.dart';
import '../screen/contact_us_screen.dart';
import '../screen/my_profile_screen.dart';
import '../screen/splash_screen.dart';
import '../screen/update_profile.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
    required String? profileFName,
    required String? profileLName,
    required String? profilePhone,
    required String? profileEmail,
  })  : _profileFName = profileFName,
        _profileLName = profileLName,
        _profilePhone = profilePhone,
        _profileEmail = profileEmail,
        super(key: key);

  final String? _profileFName;
  final String? _profileLName;
  final String? _profilePhone;
  final String? _profileEmail;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal,
                        backgroundImage: NetworkImage(
                            "https://media.istockphoto.com/id/1227618801/vector/human-face-avatar-icon-profile-for-social-network-man-vector-illustration.jpg?s=170667a&w=0&k=20&c=YW_cwPaiX8pHXaOGiX_3tQKRk8NU0ef8ylNq23HdxDI="),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 3, bottom: 3, right: 4, left: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.mode_edit_outline),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Edit Profile",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ).onTap(() async {
                        const UpdateProfileScreen().launch(context);
                      })
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        _profileFName!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        _profileLName!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    _profilePhone!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _profileEmail!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),

          // My Profile
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(' My Profile '),
            onTap: () {
              const MyProfileScreen().launch(context);
            },
          ),

          // Contact Us
          ListTile(
            leading: const Icon(Icons.hourglass_empty),
            title: const Text(' Contact Us'),
            onTap: () {
              const ContactUsScreen().launch(context);
            },
          ),

          // Change Password
          ListTile(
            leading: const Icon(Icons.security_outlined),
            title: const Text(' Change Password'),
            onTap: () {
              const ChangePassword().launch(context);
            },
          ),

          // Update Profile
          ListTile(
            leading: InkWell(
                onTap: () {
                  // const UpdateProfileScreen().launch(context);
                },
                child: const Icon(Icons.edit)),
            title: const Text(' Update Profile '),
            onTap: () {},
          ),

          //  Logout
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('token', '');
              SplashScreen().launch(context);
            },
          ),

          // Login out All Device
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text('Logout All Devices'),
            onTap: () async {
              EasyLoading.show(status: "Login Out");
              var result = await NewsRepo().userLogoutRepo();
              if (result) {
                EasyLoading.showSuccess("Log Out Successful");
                SplashScreen().launch(context);
              } else {
                EasyLoading.showError("Failed");
              }
            },
          ),
        ],
      ),
    );
  }
}
