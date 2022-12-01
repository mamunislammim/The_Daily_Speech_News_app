// Done

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
 const DrawerWidget(
      {super.key,
      required this.fName,
      required this.lName,
      required this.email,
      required,
      this.phone});

  final String? fName;
  final String? lName;
  final String? email;
  final String? phone;

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
                  // Profile Icon & Edit Profile
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

                  // First Name & Last Name
                  Row(
                    children: [
                      // First Name
                      Text(
                        fName ?? "",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),

                      // Last Name
                      Text(
                        lName ?? "",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  // Phone
                  Text(
                    phone ?? "",
                    style:   TextStyle(
                        color: Colors.white.withOpacity(.8),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),

                  // Email
                  Text(
                    email ?? "",
                    style:   TextStyle(
                        color: Colors.white.withOpacity(.8),
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
            leading: const Icon(Icons.contact_mail),
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
            title: const Text('Logout from All Devices'),
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
