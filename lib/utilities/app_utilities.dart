import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

isLoggedIn() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
}