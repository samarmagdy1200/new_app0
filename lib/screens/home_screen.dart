import 'package:flutter/material.dart';
import 'package:new_app/shared_ui/navigation_drawer.dart';
import 'tab_screens/whatsNew.dart';
import 'tab_screens/popular.dart';
import 'tab_screens/favourites.dart';
import 'package:new_app/screens/pages/help.dart';
import 'package:new_app/screens/pages/setting.dart';
import 'package:new_app/screens/pages/contact.dart';
import 'package:new_app/screens/pages/about.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopOutMenu { HELP, ABOUT, SETTINGS, CONTACT }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Explore"),
          centerTitle: false,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            _popOutMenu(context),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "WHAT'S NEW"),
              Tab(text: "POPULAR"),
              Tab(text: "FAVOURITES"),
            ],
            controller: _tabController,
          ),
        ),
        drawer: NavigationDrawer(),
        body: Center(
            child: TabBarView(children: [
          WhatsNew(),
          Popular(),
          Favourites(),
        ], controller: _tabController)));
  }

  Widget _popOutMenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(itemBuilder: (context) {
      return [
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.ABOUT,
          child: Text('ABOUT'),
        ),
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.HELP,
          child: Text('HELP'),
        ),
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.SETTINGS,
          child: Text('SETTINGS'),
        ),
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.CONTACT,
          child: Text('CONTACT'),
        ),
      ];
    }, onSelected: (PopOutMenu menu) {
      switch (menu) {
        case PopOutMenu.ABOUT:
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AboutUs();
          }));
          break;
        case PopOutMenu.SETTINGS:
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Settings();
          }));
          break;
        case PopOutMenu.CONTACT:
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ContactUs();
          }));
          break;
        case PopOutMenu.HELP:
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Help();
          }));
          break;
      }
    });
  }
}
