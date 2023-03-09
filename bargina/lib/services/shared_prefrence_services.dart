import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../screens/auth/model/login_model.dart';
import '../utils/constants.dart';

class SharedPreferencesServices{

  SharedPreferences? _prefs;

  SharedPreferencesServices() {
    init();
  }

   init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> storeAuthInfo(LoginModel success) async{
     await _prefs!.setBool(LOGIN, true);
     await _prefs!.setString(USERINFO, jsonEncode(success));
  }

  Future<void> removeAuthInfo() async{
    await _prefs!.setBool(LOGIN, false);
   // await _prefs!.setString(USERINFO, '{}');
  }

  Future<LoginModel> getUserAuthInfo() async{
    String? userInfo = _prefs!.getString(USERINFO);
    log('userrrrrrrrrrrrrrrrrrr--------$userInfo');
    return LoginModel.fromJson(jsonDecode(userInfo?? '{}'));
  }

  Future<bool?> checkLogin() async{
    bool? isLogin=  await _prefs!.getBool(LOGIN);
    return isLogin;
  }

  Future<void> saveSearch(String val) async{
    List<String>? searches =  _prefs!.getStringList('searchList') ?? [];
    searches.add(val);
    await _prefs!.setStringList('searchList', searches);
  }

  Future<List<String>> getSearches() async{
    List<String>? searches =  _prefs!.getStringList('searchList');
    return searches ?? [];
  }


}