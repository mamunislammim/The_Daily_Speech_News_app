import 'dart:convert';
 import 'package:news_app_with_api/models/Details_news_model.dart';
import 'package:news_app_with_api/models/Login_models.dart';
import '../Data_List/server_config.dart';
import '../models/Latest_news_models.dart';
import 'package:http/http.dart' as http;
import '../models/News_category_model.dart';
import '../models/User_registration_model.dart';

class NewsRepo{

  // Latest News
  Future<LatestNewsModels> latestNewsRepo()async{
    var response = await http.get(Uri.parse(Server.newsServerUrl+ Server.latestNewsUrl));
    if(response.statusCode==200){
      return LatestNewsModels.fromJson(jsonDecode(response.body));
    }
    else{
      return throw Exception("Error");
    }
  }
  
  // Details News
  Future<DetailsNewsModel> detailsNewsRepo(String id)async{
    var response = await http.get(Uri.parse(Server.newsServerUrl+ Server.detailsNewsUrl + id));
    if(response.statusCode==200){
      return DetailsNewsModel.fromJson(jsonDecode(response.body));
    }
    else{
      return throw Exception("Error");
    }
  }

  // News Category
  Future<NewsCategoryModel> newsCategory()async{
    var response = await http.get(Uri.parse(Server.newsServerUrl+ Server.newsCategoryUrl));
    if(response.statusCode==200){
      return NewsCategoryModel.fromJson(jsonDecode(response.body));
    }
    else{
      return throw Exception("Error");
    }
  }

  // User Registration
  Future<bool> userRegistrationRepo(String fName, String lName, String email,String phone, String password, String cPassword)async{
      var response = await http.post(Uri.parse(Server.accountServerUrl+Server.registrationUrl),body: <String,String>{
        'first_name' : fName,
        'last_name': lName,
        'email': email,
        'phone': phone,
        'password': password,
        'password_confirmation': cPassword
      });

      var data = jsonDecode(response.body);
      if(response.statusCode==200){
        UserRegistrationModel.fromJson(data);
        return true;
      }
      else{
        print(response.statusCode);
        return false;
      }
  }

  // User Login
  Future<bool> logInRepo(String email, String password)async{
    var response = await http.post(Uri.parse(Server.accountServerUrl+Server.loginUrl),body: <String,String>{
      'email': email,
      'password': password
    });

    if(response.statusCode==200){
     LoginModels.fromJson(jsonDecode(response.body));
      return true;
    }
    else{
      return false;
    }
  }

}