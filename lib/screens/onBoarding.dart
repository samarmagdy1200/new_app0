import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_app/pageModel.dart';
import 'package:new_app/screens/home_screen.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<PageModel> pages;

  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);
  void _addPages() {
    pages = List<PageModel>();
    pages.add(PageModel("assets/images/bg.png", "welcome", Icons.ac_unit,
        "1-fdhhhhhhhhhhhhhhjkkkkggggggggggg"));

    pages.add(PageModel("assets/images/bg2.png", "alarm", Icons.access_alarms,
        "2-kkkjjjlllllllllll"));

    pages.add(PageModel(
        "assets/images/bg3.png", "print", Icons.print, "3-dgbjjjjjjjjjjjjjj"));

    pages.add(PageModel(
        "assets/images/bg4.png", "map", Icons.map, "4-errrrrrrrrrrrrr"));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();

    return Scaffold(
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(pages[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Transform.translate(
                          child: Icon(
                            pages[index].icon,
                            size: 150,
                            color: Colors.white,
                          ),
                          offset: Offset(0, -50),
                        ),
                        Text(
                          pages[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            letterSpacing: 1
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:20),
                          child: Text(
                            pages[index].description,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,

                            ),

                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top:20),
                          child:_displayPageIndicator(pages.length)
                        )
                      ],
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              //method
                              builder:(context){
                                _updateSeen();
                                return HomeScreen();
                              }

                            ),
                            );
                          },
                          child: Text("Get Started",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20, letterSpacing: 1)),
                          color: Colors.red[900],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index){
              _pageViewNotifier.value = index;
            },
          ),
        );


  }


  Widget _displayPageIndicator(int length){
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      //number of circle
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 12,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12,
          color: Colors.red,
        ),
      ),
    );
  }


  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}
