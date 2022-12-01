import 'dart:convert';
import 'package:news_app_with_api/models/Details_news_model.dart';
import 'package:news_app_with_api/models/Login_models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Data_List/server_config.dart';
import '../models/Category_news_list_models.dart';
import '../models/Contact_us_model.dart';
import '../models/Latest_news_models.dart';
import 'package:http/http.dart' as http;
import '../models/News_category_model.dart';
import '../models/User_registration_model.dart';

class NewsRepo {

  // Latest News
  Future<LatestNewsModels> latestNewsRepo() async {
    var response =
        await http.get(Uri.parse(Server.newsServerUrl + Server.latestNewsUrl));
    if (response.statusCode == 200) {
      return LatestNewsModels.fromJson(jsonDecode(response.body));
    } else {
      return throw Exception("Error");
    }
  }

  // Details News
  Future<DetailsNewsModel> detailsNewsRepo(String id) async {
    var response = await http
        .get(Uri.parse(Server.newsServerUrl + Server.detailsNewsUrl + id));
    if (response.statusCode == 200) {
      return DetailsNewsModel.fromJson(jsonDecode(response.body));
    } else {
      return throw Exception("Error");
    }
  }

  // News Category
  Future<NewsCategoryModel> newsCategory() async {
    var response = await http
        .get(Uri.parse(Server.newsServerUrl + Server.newsCategoryUrl));
    if (response.statusCode == 200) {
      return NewsCategoryModel.fromJson(jsonDecode(response.body));
    } else {
      return throw Exception("Error");
    }
  }

  // Category news list
  Future<CategoryNewsListModels> categoryNewsListRepo(String id)async{
    var response = await http.get(Uri.parse(Server.newsServerUrl+Server.categoryNewsListUrl+ id));

    if(response.statusCode==200){
      return CategoryNewsListModels.fromJson(jsonDecode(response.body));
    }
    else{
      return throw Exception("Error ");
    }
  }

  // User Registration
  Future<bool> userRegistrationRepo(String fName, String lName, String email,
      String phone, String password, String cPassword) async {
    var response = await http.post(
        Uri.parse(Server.accountServerUrl + Server.registrationUrl),
        body: <String, String>{
          'first_name': fName,
          'last_name': lName,
          'email': email,
          'phone': phone,
          'password': password,
          'password_confirmation': cPassword
        });
    final prefs = await SharedPreferences.getInstance();
    var data = jsonDecode(response.body);
    if (response.statusCode == 201) {
      var message = UserRegistrationModel.fromJson(data);
      prefs.setString('token', message.accessToken.toString());
      return true;
    } else {
      // print(response.statusCode);
      return false;
    }
  }

  // User Login
  Future<bool> logInRepo(String email, String password) async {
    var response = await http.post(
        Uri.parse(Server.accountServerUrl + Server.loginUrl),
        body: <String, String>{'email': email, 'password': password});
    final prefs = await SharedPreferences.getInstance();
    if (response.statusCode == 200) {
      var message = LoginModels.fromJson(jsonDecode(response.body));
        prefs.setString('token', message.accessToken.toString());
      //print("token : ${message.accessToken.toString()}");
      return true;
    } else {
      return false;
    }
  }

  // Update Profile
  Future<bool> updateProfileRepo(
      String fName, String lName, String email, String phone) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var response = await http.post(
        Uri.parse(Server.accountServerUrl + Server.updateProfileUrl),
        body: <String, String>{
          'first_name': fName,
          'last_name': lName,
          'email': email,
          'phone': phone
        },
        headers: <String, String>{
          'Authorization': "Bearer $token"
        });
    if (response.statusCode == 200) {
        return true;
    } else {
      throw Exception("Error Update Profile");
    }
  }

  // User Logout
  Future<bool> userLogoutRepo() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var response = await http.get(
        Uri.parse(Server.accountServerUrl + Server.userLogoutUrl),
        headers: <String, String>{'Authorization': "Bearer $token"});

    if (response.statusCode == 200) {
      print("User Log Out true : ${response.statusCode}");
      prefs.setString('token', '');
      return true;
    } else {
      print("User Log Out  : ${response.statusCode}");
      return false;
    }
  }

  // Change Password
  Future<bool> changePasswordRepo(
      String currentPass, String newPass, String cNewPass) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var response = await http.post(
        Uri.parse(Server.accountServerUrl + Server.changePasswordUrl),
        body: <String, String>{
          'current_password' : currentPass,
          'password': newPass,
          'password_confirmation': cNewPass
        },
        headers: <String, String>{
          'Authorization': "Bearer $token"
        });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Error Update Profile");
    }
  }

  // contact us
  Future<bool> contactUsRepo(String name,String email, String message)async{
    var response =await http.post(Uri.parse(Server.newsServerUrl+Server.contactUsUrl),body: <String,String>{
      'name' : name,
      'email': email,
      'message':message
    });

    if(response.statusCode==200){
      ContactUsModel.fromJson(jsonDecode(response.body));
      return true;
    }
    else{
      return false;
    }
  }



}
