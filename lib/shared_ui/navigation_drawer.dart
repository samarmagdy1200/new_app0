import 'package:flutter/material.dart';
import 'package:new_app/models/nav_menu.dart';
import 'package:new_app/screens/home_screen.dart';
import 'package:new_app/screens/headLine_news.dart';
import 'package:new_app/screens/instagram_feed.dart';
import 'package:new_app/screens/tweeter_feed.dart';
import 'package:new_app/screens/facebook_feed.dart';
import 'package:new_app/utilities/api_utilities.dart';
import 'package:new_app/screens/login.dart';
import "package:shared_preferences/shared_preferences.dart";


class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  static bool isLoggedIn = false;
  String token;
  SharedPreferences sharedPreferences;

  List<NavMenuItem> navigationMenu = [
    NavMenuItem("Explore", () => HomeScreen()),
    NavMenuItem("HeadLine News", () => HeadLineNews()),
    NavMenuItem("Tweeter Feeds", () => TweeterFeed()),
    NavMenuItem("Instagram Feeds", () => InstagramFeed()),
   // NavMenuItem("Login", () => Login()),
    //NavMenuItem("Register", () => Register()),
    //NavMenuItem("Logout", () => Logout()),



  ];

  _checkToken() async{
  SharedPreferences sharedPreferences =await SharedPreferences.getInstance();

  token = sharedPreferences.get("token");

    setState(() {
      if(token == null){
        isLoggedIn = false;
      }else{
        isLoggedIn = true;
      }
    });

  }

  _logout(){
    if(sharedPreferences != null){
        sharedPreferences.remove("token");
    }
    return HomeScreen();

  }
  @override
  void initState(){
    super.initState();

    if(isLoggedIn){
      navigationMenu.add( NavMenuItem("Logout", _logout));
    }
  }
  Widget build(BuildContext context) {

      return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 50),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: EdgeInsets.only(top: 10, left: 30),
              child: ListTile(
                title: Text(
                  navigationMenu[position].title,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return navigationMenu[position].destination();
                  }));
                },
              ),
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}
