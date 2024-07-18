

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../modules/model/user_login_model.dart';

class UserSession{

  UserSession._internal();
  static final UserSession _instance = UserSession._internal();
  factory UserSession(){
    return _instance;
  }

  static const String isFirstTime = "IS_FIRST_TIME";
  static const String userData = "USER_DATA";


  Future<void> createSession({required UserLoginModel userLoginModel}) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString(userData,jsonEncode(userLoginModel.toJsonForSession()));
  }


  Future<UserLoginModel> getUserLoginModel() async{
    SharedPreferences preference = await SharedPreferences.getInstance();
    return UserLoginModel.fromSessionData(jsonDecode(preference.getString(userData)??'{}'));
  }

  Future<bool> isUserFirstLoggedIn()async{
    final preference = await SharedPreferences.getInstance();
    return preference.getBool(isFirstTime)??true;
  }

  Future<void> firstTimeLoggedIN()async{
    final preference = await SharedPreferences.getInstance();
    preference.setBool(isFirstTime, false);
  }



}