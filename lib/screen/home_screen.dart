import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/Widget/account_page_widget.dart';
import 'package:news_app_with_api/Widget/category_page_widget.dart';
import 'package:news_app_with_api/Widget/home_page_widget.dart';
import '../Widget/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 1;
  void _setIndex(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  List<Widget> widgetPage = [
    const CategoryPageWidget(),
    const HomePageWidget(),
    const AccountPageWidget(),
  ];

  String? _profileFName = "";
  String? _profileLName = "";
  String? _profileEmail = "";
  String? _profilePhone = "";
  void getName() async {
    final prefs = await SharedPreferences.getInstance();
    _profileFName = prefs.getString("fName");
    _profileLName = prefs.getString("fName");
    _profileEmail = prefs.getString("email");
    _profilePhone = prefs.getString("phone");
  }

  @override
  void initState() {
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Drawer
        drawer: DrawerWidget(
            profileFName: _profileFName,
            profileLName: _profileLName,
            profilePhone: _profilePhone,
            profileEmail: _profileEmail),

        // AppBar
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Thoughtful News",
                style: TextStyle(
                    color: Colors.white.withOpacity(.8), fontSize: 14),
              ),
              const Text(
                "BD NEWS 24",
                style: TextStyle(color: Colors.white, fontSize: 30),
              )
            ],
          ),
          centerTitle: true,
        ),

        // Body
        body: widgetPage[_currentPage],

        // Bottom Navigation bar
        bottomNavigationBar: FloatingNavbar(
          selectedBackgroundColor: Colors.teal,
          selectedItemColor: Colors.white,
          borderRadius: 1,
          margin: EdgeInsets.zero,
          backgroundColor: Colors.blueGrey,
          currentIndex: _currentPage,
          onTap: _setIndex,
          items: [
            FloatingNavbarItem(icon: Icons.tv, title: 'Category'),
            FloatingNavbarItem(icon: Icons.home, title: 'Home'),
            FloatingNavbarItem(icon: Icons.account_circle, title: 'Account'),
          ],
        ),
      ),
    );
  }
}
